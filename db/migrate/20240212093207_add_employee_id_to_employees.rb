class AddEmployeeIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :employee_id, :string
    add_index :employees, :employee_id, unique: true
  end
end
