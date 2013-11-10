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

ActiveRecord::Schema.define(version: 20131109031339) do

  create_table "appointments", force: true do |t|
    t.datetime "start"
    t.string   "name"
    t.string   "email"
    t.integer  "post_id"
    t.boolean  "confirmed"
  end

  add_index "appointments", ["post_id"], name: "index_appointments_on_post_id", using: :btree

  create_table "availabilities", force: true do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "slotSize"
    t.integer  "post_id"
  end

  create_table "posts", force: true do |t|
    t.date    "start"
    t.date    "end"
    t.text    "description"
    t.boolean "available"
    t.float   "monthly"
    t.float   "security"
    t.boolean "last"
    t.string  "address1"
    t.string  "address2"
    t.string  "city"
    t.string  "postal"
    t.string  "state"
  end

end
