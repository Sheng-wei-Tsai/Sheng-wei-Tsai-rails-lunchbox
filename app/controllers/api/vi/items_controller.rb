class Api::Vi::ItemsController < ApplicationController
  def favorite
    render json: {name: 'Hi', age: 18 }
  end
end
