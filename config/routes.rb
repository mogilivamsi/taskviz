Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 resources :employees
 get 'calculate_tax_deductions', to: 'tax_deductions#calculate_tax_deductions'

end
