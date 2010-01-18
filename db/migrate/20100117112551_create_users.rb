class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :email,               :null => false                # optional, you can use login instead, or both
      t.string    :crypted_password,    :null => false                # optional, see below
      t.string    :password_salt,       :null => false                # optional, but highly recommended
      t.string    :persistence_token,   :null => false                # required
      t.string    :single_access_token, :null => false                # optional, see Authlogic::Session::Params
      t.string    :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability      
      
      t.string    :player_name
      t.string    :matricule
      t.integer   :perception, :default => 5
      t.text      :sight, :default => ""
      t.datetime  :sight_updated_at
      t.timestamps
    end
    add_index :users, :id
    add_index :users, :matricule
    
    User.create(:email => "franck.dagostini@gmail.com", :password => "admin", :password_confirmation => "admin", :matricule => "1479", :player_name => "Barouf")
    User.create(:email => "renaud.payen@free.fr", :password => "renaud", :password_confirmation => "renaud", :matricule => "1481", :player_name => "Calvaire")
    User.create(:email => "v.payen@free.fr", :password => "payou", :password_confirmation => "payou", :matricule => "1195", :player_name => "BriseFer")
    User.create(:email => "jos.chaves@gmail.com", :password => "jose", :password_confirmation => "jose", :matricule => "1212", :player_name => "Sans-Os")
    User.create(:email => "eric.vachez@free.fr", :password => "eric", :password_confirmation => "eric", :matricule => "1048", :player_name => "Erkeos")
    User.create(:email => "regis.blondel@aliceadsl.fr", :password => "regis", :password_confirmation => "regis", :matricule => "1209", :player_name => "Berserker")
    
  end

  def self.down
    drop_table :users
  end
end
