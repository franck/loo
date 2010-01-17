class Field < ActiveRecord::Base
  
  def self.create_or_update(x,y,type)
    field = Field.find(:first, :conditions => ["pos_x = ? AND pos_y = ?", x, y])
    if field
      field.update_attributes(:field_type => Field.get_type(type), :html_class => type)
    else
      Field.create(:pos_x => x, :pos_y => y, :field_type => Field.get_type(type), :html_class => type)
    end
  end
  
  def self.get_type(type)
    case type
    when "t3"
      "plaine"
    when "t197"
      "fleurs"
    when "t4"
      "ville"
    end
  end
  
end
