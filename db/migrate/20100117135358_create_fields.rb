class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.integer :pos_x
      t.integer :pos_y
      t.string :field_type, :default => ""
      t.string :html_class, :default => ""
      t.string :landscape_id

      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
