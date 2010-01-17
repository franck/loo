class AddSightToUsers < ActiveRecord::Migration
  def self.up
    add_column   :users, :player_name, :string
    add_column   :users, :sight, :text
    add_column   :users, :sight_updated_at, :datetime
  end

  def self.down
    remove_column :users, :player_name
    remove_column :users, :sight
    remove_column :users, :sight_updated_at
  end
end
