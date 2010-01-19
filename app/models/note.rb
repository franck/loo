class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :player
  
  default_scope :order => 'updated_at DESC'
  named_scope :last, lambda {|*args| { :limit => (args.first || 1), :order => "updated_at desc" }}
  named_scope :player, lambda {|*args| { :conditions => ["player_id = ?", args.first]}}
end
