# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111018132022) do

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", :force => true do |t|
    t.integer  "user_id"
    t.string   "qualification"
    t.float    "percentage"
    t.date     "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "subject"
    t.text     "body"
    t.integer  "replying_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => ""
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name",             :limit => 50
    t.string   "last_name",              :limit => 50
    t.string   "phone",                  :limit => 15
    t.string   "location",               :limit => 50
    t.boolean  "email_subscription"
    t.string   "avatar_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "mission_statement"
    t.string   "status_message"
    t.string   "position"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "work_histories", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "company"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
  end

end
