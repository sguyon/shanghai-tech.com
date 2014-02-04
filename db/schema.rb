# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121209114600) do

  create_table "companies", :force => true do |t|
    t.string   "name_en"
    t.string   "title"
    t.string   "email"
    t.string   "twitter"
    t.string   "weibo"
    t.string   "website"
    t.string   "linkedin"
    t.string   "blog_feed"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "company_type"
    t.text     "description",  :limit => 255
    t.string   "image"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.string   "adress"
    t.string   "name_cn"
    t.integer  "image_width"
    t.integer  "image_height"
  end

  create_table "companies_company_types", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "company_type_id"
  end

  create_table "companies_people", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "person_id"
  end

  add_index "companies_people", ["company_id", "person_id"], :name => "index_companies_people_on_company_id_and_person_id"
  add_index "companies_people", ["person_id", "company_id"], :name => "index_companies_people_on_person_id_and_company_id"

  create_table "company_types", :force => true do |t|
    t.string   "name_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name_cn"
  end

  create_table "event_types", :force => true do |t|
    t.string   "name_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name_cn"
  end

  create_table "event_types_events", :id => false, :force => true do |t|
    t.integer "event_type_id"
    t.integer "event_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name_en"
    t.string   "event_type1"
    t.string   "email"
    t.text     "description",  :limit => 255
    t.string   "twitter"
    t.string   "weibo"
    t.string   "website"
    t.string   "blog_feed"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "event_type2"
    t.string   "event_type3"
    t.integer  "user_id"
    t.string   "image"
    t.string   "name_cn"
    t.integer  "image_width"
    t.integer  "image_height"
  end

  create_table "events_people", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "person_id"
  end

  add_index "events_people", ["event_id", "person_id"], :name => "index_events_people_on_event_id_and_person_id"
  add_index "events_people", ["person_id", "event_id"], :name => "index_events_people_on_person_id_and_event_id"

  create_table "job_types", :force => true do |t|
    t.string   "name_en"
    t.string   "name_cn"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "label"
  end

  create_table "job_types_jobs", :id => false, :force => true do |t|
    t.integer "job_id"
    t.integer "job_type_id"
  end

  create_table "jobs", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
    t.string   "title_en"
    t.string   "title_cn"
    t.string   "short_description"
    t.text     "long_description"
    t.string   "website"
    t.string   "email"
    t.integer  "company_id"
  end

  create_table "people", :force => true do |t|
    t.string   "name_en"
    t.string   "twitter"
    t.string   "weibo"
    t.string   "website"
    t.string   "blog"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "position"
    t.string   "skill1"
    t.string   "skill2"
    t.string   "skill3"
    t.text     "description",  :limit => 255
    t.string   "image"
    t.integer  "user_id"
    t.text     "question1",    :limit => 255
    t.text     "question2",    :limit => 255
    t.text     "question3",    :limit => 255
    t.text     "question4",    :limit => 255
    t.string   "name_cn"
    t.integer  "image_width"
    t.integer  "image_height"
  end

  create_table "people_skills", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "skill_id"
  end

  create_table "skills", :force => true do |t|
    t.string   "name_en"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name_cn"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "perishable_token",                 :default => "", :null => false
    t.integer  "admin",             :limit => 255, :default => 0
  end

  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
