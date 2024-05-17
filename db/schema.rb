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

ActiveRecord::Schema[7.1].define(version: 2024_05_17_143650) do
  create_table "custom_attributes", force: :cascade do |t|
    t.string "attribute_name"
    t.string "attribute_value"
    t.string "customizable_type"
    t.integer "customizable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customizable_type", "customizable_id"], name: "index_custom_attributes_on_customizable"
  end

  create_table "custom_attributes_configs", force: :cascade do |t|
    t.string "parent_model"
    t.string "custom_attributes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
