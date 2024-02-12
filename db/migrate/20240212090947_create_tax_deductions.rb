class CreateTaxDeductions < ActiveRecord::Migration[7.0]
  def change
    create_table :tax_deductions do |t|
      t.references :employee, null: false, foreign_key: true
      t.decimal :yearly_salary
      t.decimal :tax_amount
      t.decimal :cess_amount

      t.timestamps
    end
  end
end
