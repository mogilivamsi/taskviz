class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_numbers
      t.date :doj
      t.integer :salary_per_month

      t.timestamps
    end
  end
end
