class Api::Vi::ItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # skip_before_action :check_login
  def favorite
    render json: {name: 'Hi', age: 18 }
  end
end
