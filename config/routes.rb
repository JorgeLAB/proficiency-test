Rails.application.routes.draw do

  root "classrooms#index"

  resources :classrooms, only: [:index, :new, :create, :show]
  resources :courses
  resources :students
end
