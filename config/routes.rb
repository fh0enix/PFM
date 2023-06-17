Rails.application.routes.draw do
  get 'reports/index'
  get "report_category" => "reports#index"
  get "report_date" => "reports#index"
  post "report_category" => "reports#report_by_category"
  post "report_date" => "reports#report_by_date"
  resources :categories
  resources :operations
  root "home#index"

end
