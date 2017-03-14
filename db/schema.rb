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

ActiveRecord::Schema.define(version: 20170314204649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grad_classes", force: :cascade do |t|
    t.string   "name"
    t.time     "startTime"
    t.time     "endTime"
    t.integer  "maximumStudents"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "professor_id"
    t.string   "professorName"
  end

  add_index "grad_classes", ["professor_id"], name: "index_grad_classes_on_professor_id", using: :btree

  create_table "gradclasses_students", id: false, force: :cascade do |t|
    t.integer "gradclass_id", null: false
    t.integer "student_id",   null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.date     "year"
    t.integer  "ssn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grad_classes", "professors"
end
