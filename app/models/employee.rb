class Employee < ApplicationRecord
    validates :employee_id, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :phone_numbers, presence: true, format: { with: /\A\d{10}(,\d{10})*\z/, message: "Please provide comma-separated 10-digit phone numbers" }
    validates :doj, presence: true
    validates :salary_per_month, presence: true, numericality: { greater_than_or_equal_to: 0 }

  
end
  