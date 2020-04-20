Rails.application.routes.draw do
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :items  do# 8條路徑
    resources :comments, only: [:create]
    # /items/:item_id/comments/new
    # /items/:item_id/comments/create
  end
  # resources :comments
  # # /comments 看到所有留言
  # # /comments/:id 
  # # /comments/new
  # # /comments/create
  # # .comments/edit

  # user
  # get "/", to: "welcome#index"
  # 泛用型的寫法
  root "items#index"
  get '/login', to: "users#login"
  post '/login', to: 'users#sign_in'
  delete "/logout", to: "users#logout"
  get '/sign_up', to: "users#sign_up"
  post '/sign_up', to: "users#registration"
  # get post put patch delete (現在瀏覽器只有get/post 這兩個動作)
  # 方法   controller 見一個檔案
  
end
