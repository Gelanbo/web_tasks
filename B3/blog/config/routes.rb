Rails.application.routes.draw do

  root 'main#welcome'

  namespace :admin do
    get '/index' => 'main#index'
    get '/login' => 'main#login'
    post '/start_login' => 'main#start_login'
    get '/signup' => 'main#signup'
    post '/start_signup' => 'main#start_signup'
    get '/list' => 'posts#list'
    get '/post_index' => 'posts#index'
    get '/comment_index' => 'comments#index'
    get '/back_index' => 'feedbacks#index'
    get '/create' => 'posts#create'
    post '/post_show/:admin_id' => 'posts#show'
    get '/post_show/:admin_id/:post_id' => 'posts#show_post'
    get '/post_show' => 'posts#show_post'
    get '/post_edit/:post_id' => 'posts#edit'
    get '/post_delete/:post_id' => 'posts#delete'
    post '/post_edits/:post_id' => 'posts#update'
    get '/pass/:comment_id' => 'comments#pass'
    get '/fail' => 'main#fail'
    get '/getoff'=> 'main#getoff'
    get '/fail_sleep'=> 'main#fail_sleep'
  end

  get '/post_shows/:admin_id/:post_id' => 'posts#shows_post'
  get '/post_show' => 'posts#show_post'
  get '/post_show/:post_id' => 'posts#show_search'
  get '/months_shows' => 'posts#months_shows'
  post '/search' => 'posts#search'
  get '/add_message/:post_id' => 'comments#create'
  post '/add_messages/:post_id' => 'comments#creates'
  get '/visit' => 'posts#index_front'
  get '/pass/:comment_id' => 'comments#pass'
  post '/feedback' => 'feedbacks#result'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
