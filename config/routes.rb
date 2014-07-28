Documentation::Engine.routes.draw do
  
  match 'new(/*path)', :to => 'pages#new', :as => 'new_page', :via => [:get, :post]
  match 'positioning(/*path)', :to => 'pages#positioning', :as => 'page_positioning', :via => [:get, :post]
  match 'edit(/*path)', :to => 'pages#edit', :as => 'edit_page', :via => [:get, :patch]
  match 'delete(/*path)', :to => 'pages#destroy', :as => 'delete_page', :via => [:delete]
  match 'screenshot', :to => 'pages#screenshot', :as => 'upload_screenshot', :via => [:get, :post]
  get 'search', :to => 'pages#search', :as => 'search'
  get '*path' => 'pages#show', :as => 'page'
  root :to => 'pages#index'
end
