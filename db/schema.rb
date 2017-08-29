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

ActiveRecord::Schema.define(version: 20170829053046) do

  create_table "assignees", force: :cascade do |t|
    t.string "name"
    t.string "jira_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_timeslips", force: :cascade do |t|
    t.integer "working_day_id"
    t.integer "assignee_id"
    t.string "issue_key"
    t.string "component"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_issue_timeslips_on_assignee_id"
    t.index ["working_day_id"], name: "index_issue_timeslips_on_working_day_id"
  end

  create_table "working_days", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
