class CreateLandscapes < ActiveRecord::Migration
  def self.up
    create_table :landscapes do |t|
      t.string :name

      t.timestamps
    end
    Landscape.create(:name => "Carte d'olympia")
  end

  def self.down
    drop_table :landscapes
  end
end
