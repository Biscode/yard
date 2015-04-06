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

ActiveRecord::Schema.define(version: 20150406175713) do

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

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "deadline"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.integer  "number"
    t.date     "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
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
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"
  add_index "tasks", ["sprint_id"], name: "index_tasks_on_sprint_id"

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
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
