class EmployeesController < ApplicationController
    def create
      @employee = Employee.new(employee_params)
  
      if @employee.save
        render json: @employee, status: :created
      else
        render json: @employee.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def employee_params
      params.require(:employee).permit(:employee_id, :first_name, :last_name, :email, :phone_numbers, :doj, :salary_per_month)
    end
  end
  