class UsersController < ApplicationController
  def login
  end

  def sign_up
    @user = User.new
  end

  def registration
    if user_params[:password] == user_params[:password_confirm]
      # 新增使用者 & 自動幫他登入
      @user = User.new(user_params)

      if @user.save 
      #成功
      # TODO:密碼加密 
      # TODO:幫忙登入
        redirect_to '/' 
      else
      #失敗
      #失敗通常不會轉址到原來頁面，這樣之前填的東西全部要再重填
        # 網誌並沒有變，借sign_up 的erb檔 留在原本網址的地方，只是畫面被重新渲染
        render :sign_up 
        
        # redirect_to '/sign_up' 繞一圈主回來
        
      end
      # (email: user[:password_confirm], password: user[:password])
      
    else 
      redirect_to '/sign_up'
    end
    # render html: params[:user]
  end

  private 
  def user_params
    # strong parameters (安全性考量)
    params.require(:user).permit( :email, 
                                  :password, 
                                  :password_confirm)
  end

end
