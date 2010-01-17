class AddMatriculeToUser < ActiveRecord::Migration
  def self.up
    add_column  :users, :matricule, :string
  end

  def self.down
    remove_column :users, :matricule
  end
end
