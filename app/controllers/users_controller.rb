class UsersController < ApplicationController
  skip_before_action :check_login
  def login
    @user = User.new # 為了讓form_for 可以正常展開
  end

  def sign_up
    @user = User.new
  end

  def sign_in
    # 查資料庫
    # select * from users #where email = ? and password = ?
    # find_by 找一筆資料而已 nil
    # where 可以一次找到很多資料 []
    user = User.find_by(email: user_params[:email], 
                        password: user_params[:password])

    if user
      session[:hello] = user.email
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def registration
      # 新增使用者 & 自動幫他登入
      @user = User.new(user_params)
      
      if @user.save 
      session[:hello] = @user.id        #幫忙登入 
      # TODO:密碼加密 
        redirect_to root_path # '/'
      else
      #失敗
      #失敗通常不會轉址到原來頁面，這樣之前填的東西全部要再重填
        # 網誌並沒有變，借sign_up 的erb檔 留在原本網址的地方，只是畫面被重新渲染
        render :sign_up      
        # redirect_to '/sign_up' 繞一圈主回來 
      end
  end

  def logout
    session[:hello] = nil
    redirect_to root_path
  end

  private 
  def user_params
    # strong parameters (安全性考量)
    params.require(:user).permit( :email, 
                                  :password, 
                                  :password_confirmation)
  end

end
