class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|      
      t.integer :pos_x
      t.integer :pos_y
      t.integer :matricule
      t.string :name
      t.string :race
      t.string :html_class

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
