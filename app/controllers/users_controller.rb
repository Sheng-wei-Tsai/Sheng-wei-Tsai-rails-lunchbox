class UsersController < ApplicationController
  def login
  end

  def sign_up
  end

  def registration
    user = params[:user]
    if user[:password] == user[:password_confirm]
      # 新增使用者 & 自動幫他登入
      
      # strong parameters (安全性考量)
      clean_user = params.require(:user).permit(:email, :password, :password_confirm)
      u = User.new(clean_user)
      
      if u.save 
      #成功
        redirect_to '/' 
      else
      #失敗
        redirect_to '/sign_up'
      end
      # (email: user[:password_confirm], password: user[:password])
      
    else 
      redirect_to '/sign_up'
    end
    # render html: params[:user]
  end

end
