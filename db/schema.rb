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

ActiveRecord::Schema.define(version: 20150425101735) do
  create_table "comments", force: :cascade do |t|
    t.integer  "task_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id"

# ActiveRecord::Schema.define(version: 20150408204330) do

ActiveRecord::Schema.define(version: 20150426163027) do

# ActiveRecord::Schema.define(version: 20150408204330) do
  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_id"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "announcements", force: :cascade do |t|
    t.text     "announcement"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "announcements", ["project_id"], name: "index_announcements_on_project_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "task_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id"

  create_table "dtasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pid"
    t.integer  "snum"
    t.float    "story_points"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "deadline"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "isPrivate"
  end

  create_table "sprints", force: :cascade do |t|
    t.integer  "number"
    t.date     "deadline"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "project_id"
    t.float    "total_points"
  end

  add_index "sprints", ["project_id"], name: "index_sprints_on_project_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.string   "priority"
    t.float    "story_points"
    t.date     "deadline"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "project_id"
    t.integer  "sprint_id"
    t.integer  "team_id"
    t.integer  "user_id"
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"
  add_index "tasks", ["sprint_id"], name: "index_tasks_on_sprint_id"
  add_index "tasks", ["team_id"], name: "index_tasks_on_team_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["project_id"], name: "index_teams_on_project_id"

  create_table "user_team_relationships", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_team_relationships", ["team_id"], name: "index_user_team_relationships_on_team_id"
  add_index "user_team_relationships", ["user_id"], name: "index_user_team_relationships_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "isAdmin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
