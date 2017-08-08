Rails.application.routes.draw do
  root 'feed#new'
  get 'feed' => redirect('/')
  post '/feed' => 'feed#create'
end
