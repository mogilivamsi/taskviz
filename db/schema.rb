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

ActiveRecord::Schema[7.0].define(version: 2024_02_12_093207) do
  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_numbers"
    t.date "doj"
    t.integer "salary_per_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_id"
    t.index ["employee_id"], name: "index_employees_on_employee_id", unique: true
  end

  create_table "tax_deductions", force: :cascade do |t|
    t.integer "employee_id", null: false
    t.decimal "yearly_salary"
    t.decimal "tax_amount"
    t.decimal "cess_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_tax_deductions_on_employee_id"
  end

  add_foreign_key "tax_deductions", "employees"
end
