class User < ActiveRecord::Base
  acts_as_authorization_subject
  acts_as_authentic do |c|
    acts_as_authentic
  end

  def player
    Player.find_by_matricule(matricule)
  end
  
  def roles
    self.role_objects.map(&:name).join(", ")
  end
  
  def filtered_sight
    return if sight.nil?
    html = sight
    
    #remove &nbsp without ";"
    pattern = /&amp;nbsp(?!;)?/
    html = html.gsub(pattern){""}
    
    #remove width
    pattern = /width="30"/
    html = html.gsub(pattern){""}
    
    #remove titles
    pattern = /title="1 mouv"/
    html = html.gsub(pattern){""}
    
    #remove onclick
    pattern = /onclick="(.[^"]*)"/
    html = html.gsub(pattern){""}
    
    #remove background
    pattern = /background="(.[^"]*)"/
    html = html.gsub(pattern){""}

    #remove src
    pattern = /src="(.[^"]*)"/
    html = html.gsub(pattern){""}
    
    #remove img : <img onclick="reda("dam.php");"/>
    pattern = /<img(.[^>]*)>/
    html = html.gsub(pattern){""}
    
  end
  
  protected
  after_save :update_landscape, :update_player_database
  
  def update_landscape
  end
  
  def update_player_database
    x = 0; y = 0
    
    doc = Nokogiri::HTML.parse(sight)
    
    axis = doc.search("td.bb").map(&:text).map(&:strip)
    logger.debug("AXIS = #{axis.inspect}")
    
    ord = doc.search("td.br").map(&:text).map(&:strip)
    logger.debug("ORD = #{ord.inspect}")
    
    rows = doc.search("tr")
    for r in (1..ord.size)
      cols = rows[r].search("td")
      for c in (1..axis.size)
        if cols[c].text =~ /\d/
          logger.debug("PLAYER #{cols[c].text} in #{axis[c-1]} / #{ord[r-1]}")
          Player.create_or_update(cols[c].text,axis[c-1],ord[r-1],cols[c]["class"])
        else
          Field.create_or_update(axis[c-1],ord[r-1],cols[c]["class"])
          logger.debug("FIELD #{cols[c]["class"]} in #{axis[c-1]} / #{ord[r-1]}")
        end
      end
    end
  end
  
end
