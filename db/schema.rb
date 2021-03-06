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

ActiveRecord::Schema.define(version: 20181016021271) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "landlords", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "photo"
    t.date "created_on"
    t.date "closed_on"
    t.boolean "active", default: true
    t.bigint "property_id"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_maintenances_on_property_id"
    t.index ["tenant_id"], name: "index_maintenances_on_tenant_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "addr_line1"
    t.string "addr_line2"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.integer "rent"
    t.date "start_date"
    t.date "end_date"
    t.boolean "active", default: true
    t.bigint "landlord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_properties_on_landlord_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "created_on"
    t.date "removed_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "username"
    t.string "password_digest"
    t.boolean "active", default: true
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_tenants_on_property_id"
  end

  add_foreign_key "maintenances", "properties"
  add_foreign_key "maintenances", "tenants"
  add_foreign_key "properties", "landlords"
  add_foreign_key "tenants", "properties"
end
