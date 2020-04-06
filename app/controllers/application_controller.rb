class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, 
            with: :active_record_not_found 

  private
  
  def active_record_not_found
    render  file: 'public/404.html', 
            status: 404,
            layout: false
  end
end
