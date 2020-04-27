class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, 
            with: :active_record_not_found 
            
  helper_method :current_user, :current_cart # 讓全站的地方都可用得到
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

  def current_cart
    @_ca1213 ||= Cart.from_hash(session[:carty])
  end

  def gateway
      Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV['bt_merchant_id'],
      public_key: ENV['bt_public_key'],
      private_key: ENV['bt_private_key']
    )
  end
end
