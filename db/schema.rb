# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100117140135) do

  create_table "fields", :force => true do |t|
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.string   "field_type",   :default => ""
    t.string   "html_class",   :default => ""
    t.string   "landscape_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fields", ["pos_x"], :name => "index_fields_on_pos_x"
  add_index "fields", ["pos_y"], :name => "index_fields_on_pos_y"

  create_table "landscapes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.integer  "matricule"
    t.string   "name"
    t.string   "race"
    t.string   "html_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["matricule"], :name => "index_players_on_matricule"
  add_index "players", ["pos_x"], :name => "index_players_on_pos_x"
  add_index "players", ["pos_y"], :name => "index_players_on_pos_y"

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.string   "player_name"
    t.string   "matricule"
    t.integer  "perception",          :default => 5
    t.text     "sight"
    t.datetime "sight_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["id"], :name => "index_users_on_id"
  add_index "users", ["matricule"], :name => "index_users_on_matricule"

end
