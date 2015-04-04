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

ActiveRecord::Schema.define(version: 20150404162416) do

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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "references"
    t.integer  "project_id"
    t.integer  "totalPoints"
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

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
