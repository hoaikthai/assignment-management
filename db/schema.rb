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

ActiveRecord::Schema.define(version: 20170429040819) do

  create_table "assignments", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "due_date"
    t.binary   "attachment", limit: 10485760
    t.integer  "group_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "user_id"
    t.index ["group_id"], name: "index_assignments_on_group_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "belongings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_belongings_on_group_id"
    t.index ["user_id", "group_id"], name: "index_belongings_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_belongings_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.datetime "sub_date"
    t.integer  "score"
    t.binary   "attachment",    limit: 10485760
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "group_id"
    t.index ["assignment_id"], name: "index_submissions_on_assignment_id"
    t.index ["group_id"], name: "index_submissions_on_group_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "gender"
    t.string   "address"
    t.date     "birthday"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
