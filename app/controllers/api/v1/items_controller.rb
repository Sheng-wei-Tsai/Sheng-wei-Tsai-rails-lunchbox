class Api::V1::ItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # skip_before_action :check_login
  # 忽略不是一個好的做法
  def favorite
    item = Item.find(params[:id])
    
    if item.favorited_by(current_user)
      #移除最愛
      # FavoriteItem.find_by(item: item, user: current_user).destroy
      current_user.items.delete(item)
      render json: {status: 'removed'}
    else
      current_user.items << item
      render json: {status: 'favorited'}
    end
    # item = Item.find(params[:id])
  end
end
