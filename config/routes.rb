Erp::Backend::Engine.routes.draw do
  devise_for :users,
    class_name: "Erp::User",
    module: :devise,
      :controllers => {
        :sessions => "erp/users/sessions",
        :registrations => "erp/users/registrations",
        :passwords => "erp/users/passwords",
        :confirmations => "erp/users/confirmations",
      }
  namespace :backend do
    get '/' => 'dashboard#index'
  end
end
