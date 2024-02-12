class TaxDeductionsController < ApplicationController
  def calculate_tax_deductions
    start_date = Date.parse("April 1")
    end_date = Date.parse("March 31")

    # employees = Employee.where(doj: start_date..end_date)

    employees = Employee.where("doj >= ? AND doj <= ?", start_date, end_date)
    
    tax_deductions = employees.map do |employee|
      {
        employee_code: employee.employee_id,
        first_name: employee.first_name,
        last_name: employee.last_name,
        yearly_salary: calculate_yearly_salary(employee),
        tax_amount: calculate_tax_amount(employee),
        cess_amount: calculate_cess_amount(employee)
      }
    end
    render json: tax_deductions
  end

  private

  def calculate_yearly_salary(employee)
    total_days_worked = (Date.today - employee.doj).to_i
    total_salary = employee.salary_per_month * (total_days_worked / 30.0)

    (total_salary * 12).to_i
  end

 
  
  # Employee.create!(
  #   first_name: 'John',last_name: 'Doe',email: 'john.doe@example.com',phone_numbers: '1234567894',doj: Date.parse('2023-04-15'),salary_per_month: 3000,employee_id: 'EMP001'
  # )

  def calculate_tax_amount(employee)
    yearly_salary = calculate_yearly_salary(employee)

    case yearly_salary
    when 0..250000
      0
    when 250001..500000
      ((yearly_salary - 250000) * 0.05).to_i
    when 500001..1000000
      12500 + ((yearly_salary - 500000) * 0.1).to_i
    else
      62500 + ((yearly_salary - 1000000) * 0.2).to_i
    end
  end

  def calculate_cess_amount(employee)
    yearly_salary = calculate_yearly_salary(employee)
    excess_amount = [0, yearly_salary - 2500000].max

    (excess_amount * 0.02).to_i
  end
end