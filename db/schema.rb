# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_10_065129) do

  create_table "policies", force: :cascade do |t|
    t.string "start_date", null: false
    t.string "end_date", null: false
    t.string "policy_type"
    t.string "category"
    t.integer "provider_id", null: false
    t.integer "product_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "pending", null: false
    t.index ["product_id"], name: "index_policies_on_product_id"
    t.index ["provider_id"], name: "index_policies_on_provider_id"
    t.index ["student_id"], name: "index_policies_on_student_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.integer "provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_products_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name", null: false
    t.string "policy_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "gender", null: false
    t.string "email", null: false
    t.string "mobile"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "policies", "products"
  add_foreign_key "policies", "providers"
  add_foreign_key "policies", "students"
  add_foreign_key "products", "providers"
end
