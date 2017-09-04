Rails.application.routes.draw do
  #resources :admins
  root 'main#welcome'
  get '/login' => 'main#login'
  post '/start_login' => 'main#start_login'
  get '/fail' => 'main#fail'
  get '/index' => 'main#index'
  get '/getoff'=> 'main#getoff'
  get '/fail_sleep'=> 'main#fail_sleep'

  #resources :posts
  get '/list' => 'posts#list'
  get '/post_index' => 'posts#index'
  get '/create' => 'posts#create'

  post '/post_show/:admin_id' => 'posts#show'
  get '/post_show/:admin_id/:post_id' => 'posts#show_post'
  get '/post_shows/:admin_id/:post_id' => 'posts#shows_post'
  get '/post_show' => 'posts#show_post'
  get '/post_show/:post_id' => 'posts#show_search'
  get '/months_shows' => 'posts#months_shows'
  post '/post_edits/:post_id' => 'posts#update'
  get '/post_edit/:post_id' => 'posts#edit'

  get '/post_delete/:post_id' => 'posts#delete'

  post '/search' => 'posts#search'

  #resources :comments
  get '/comment_index' => 'comments#index'
  get '/add_message/:post_id' => 'comments#create'
  post '/add_messages/:post_id' => 'comments#creates'

  get '/visit' => 'posts#index_front'
  get '/pass/:comment_id' => 'comments#pass'

  #resources :feedbacks
  post '/feedback' => 'feedbacks#result'
  get '/back_index' => 'feedbacks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
