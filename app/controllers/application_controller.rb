class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, 
            with: :active_record_not_found 
            
  helper_method :current_user # 讓全站的地方都可用得到
  # include UserHelper 在view helper 
  before_action :check_login

  private

  def check_login
    redirect_to login_path unless current_user
  end
  
  def active_record_not_found
    render  file: 'public/404.html', 
            status: 404,
            layout: false
  end

  def current_user
    # id
    User.find_by(id: session[:hello])
  end
end
