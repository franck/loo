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
        square = cols[c]        
        if player?(square)
          #logger.debug("PLAYER #{cols[c].text} in #{axis[c-1]} / #{ord[r-1]}")
          params = get_player_params(square)
          html_class = square["class"]
          params.merge!({ :race => Player.get_race(html_class), :html_class => html_class})
          Player.create_or_update(params)
        else
          Field.create_or_update(axis[c-1],ord[r-1],square["class"])
          #logger.debug("FIELD #{cols[c]["class"]} in #{axis[c-1]} / #{ord[r-1]}")
        end
      end
    end
  end
  
  def player?(square)
    square["onclick"] =~ /voir/
  end
  
  def get_player_params(square)
    # voir(event,27,16,1884,'Sunagaara','[sous la protection d’elia furienoire] XD');
    pattern = /voir\((.*);$/
    result = square["onclick"].scan(pattern)
    params = result[0][0].split(",")
    pos_x = params[1]
    pos_y = params[2]
    matricule = params[3]
    name = params[4].gsub(/'/){""}
    return { :pos_x => pos_x, :pos_y => pos_y, :matricule => matricule, :name => name }
  end
  
end
