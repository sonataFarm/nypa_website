Rails.application.routes.draw do
  root 'static_pages#root'
  get 'admin', to: 'static_pages#admin'
end
