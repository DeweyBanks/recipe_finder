Rails.application.routes.draw do
  root 'welcome#index'
  get '/search' => 'welcome#search'
end
