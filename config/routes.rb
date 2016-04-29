Rails.application.routes.draw do
  resources :classrooms, only: [:index, :new, :create]
  resources :courses
  resources :students
end
