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

ActiveRecord::Schema.define(version: 20151006095822) do

  create_table "facets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "facets_metakeys", id: false, force: :cascade do |t|
    t.integer "facet_id"
    t.integer "metakey_id"
  end

  add_index "facets_metakeys", ["facet_id"], name: "index_facets_metakeys_on_facet_id"
  add_index "facets_metakeys", ["metakey_id"], name: "index_facets_metakeys_on_metakey_id"

  create_table "metakeys", force: :cascade do |t|
    t.string   "name"
    t.string   "typeof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metavalues", force: :cascade do |t|
    t.string   "value"
    t.integer  "user_id"
    t.integer  "metakey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "metavalues", ["user_id"], name: "index_metavalues_on_user_id"

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
