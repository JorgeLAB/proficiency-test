Rails.application.routes.draw do
  resources :classrooms, only: [:index, :new, :create, :show]
  resources :courses
  resources :students
end
