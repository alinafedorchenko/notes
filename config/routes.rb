Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"

  resources :notes
end
