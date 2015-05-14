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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140905195238) do

  create_table "description_files", force: true do |t|
    t.text     "descripion"
    t.integer  "user_story_id"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "description_files", ["user_story_id"], name: "index_description_files_on_user_story_id"

  create_table "profiles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_comments", force: true do |t|
    t.integer  "project_id"
    t.integer  "creator"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_comments", ["project_id"], name: "index_project_comments_on_project_id"

  create_table "project_user_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_user_relations", ["project_id"], name: "index_project_user_relations_on_project_id"
  add_index "project_user_relations", ["user_id"], name: "index_project_user_relations_on_user_id"

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator"
  end

  create_table "projects_users", id: false, force: true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "tasks", force: true do |t|
    t.string   "description"
    t.string   "state"
    t.integer  "user_story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["user_story_id"], name: "index_tasks_on_user_story_id"

  create_table "tasks_users_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks_users_relations", ["task_id"], name: "index_tasks_users_relations_on_task_id"
  add_index "tasks_users_relations", ["user_id"], name: "index_tasks_users_relations_on_user_id"

  create_table "user_stories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "state"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_stories", ["project_id"], name: "index_user_stories_on_project_id"

  create_table "user_story_comments", force: true do |t|
    t.text     "comment"
    t.integer  "creator"
    t.integer  "user_story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_story_comments", ["user_story_id"], name: "index_user_story_comments_on_user_story_id"

  create_table "user_story_user_relations", force: true do |t|
    t.integer  "user_id"
    t.integer  "user_story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_story_user_relations", ["user_id"], name: "index_user_story_user_relations_on_user_id"
  add_index "user_story_user_relations", ["user_story_id"], name: "index_user_story_user_relations_on_user_story_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "user_email"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
