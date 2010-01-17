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
      t.text      :sight, :default => ""
      t.datetime  :sight_updated_at
      t.timestamps
    end
    User.create(:email => "franck.dagostini@gmail.com", :password => "admin", :password_confirmation => "admin", :matricule => "1479", :player_name => "Barouf")
  end

  def self.down
    drop_table :users
  end
end
