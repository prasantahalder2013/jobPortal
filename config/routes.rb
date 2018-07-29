Rails.application.routes.draw do

devise_for :admins, controllers: {
	sessions: 'admins/sessions'
}
devise_for :org_admins, controllers: {
	sessions: 'org_admins/sessions'
}
  
resources :jobs, only: [:index] do
	resources :job_applications, only: [:new, :create]
end

match 'accept_invitation' => 'job_applications#accept_invitation', via: [:get]
match 'reject_invitation' => 'job_applications#reject_invitation', via: [:get]
match 'add_note' => 'job_applications#add_note', via: [:get]
match 'create_note' => 'job_applications#create_note', via: [:post]

namespace :org_admins do
	resources :vacancies, only: [:new, :create]
	resources :job_applications, only: [:index, :edit, :update]
end

namespace :admins do
	resources :vacancies, only: [:update]
end  

authenticated :admin do
  root :to => "admins/dashboard#index"
end

authenticated :org_admin do
  root :to => "org_admins/dashboard#index"
end

root to: 'jobs#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
