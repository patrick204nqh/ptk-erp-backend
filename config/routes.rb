Erp::Backend::Engine.routes.draw do
  get "/", to: "dashboard#index", as: "dashboard"
end
