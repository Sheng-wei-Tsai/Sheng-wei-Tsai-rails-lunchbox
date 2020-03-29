Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/", to: "welcome#index"
  # 泛用型的寫法
  root "welcome#index"

  get '/login', to: "users#login" 
  get '/sign_up', to: "users#sign_up"
  post '/sign_up', to: "users#registration"

  # 方法   controller 見一個檔案
  
end
