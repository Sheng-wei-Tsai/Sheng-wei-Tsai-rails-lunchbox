class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
    @category = @item.category.name
  end

  def new
    @item = Item.new  
  end

  def create
    @item = Item.new(item_params)
    
    if  @item.save
      # flash[:notice] = "成功新增餐點"
      # redirect_to items_path
      redirect_to items_path , notice: '成功新增餐點'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path, notice: "成功更新餐點"
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    # @item.update(deleted_at: Time.now)
    redirect_to items_path, notice: '成功刪除餐點'
  end

  private
  def find_item
    @item = Item.find(params[:id])
    # @item = Item.find_by!(id: params[:id], deleted_at: nil )
  end
  def item_params
    params.require(:item).permit( :name,
                                  :description,
                                  :price,
                                  :cover,
                                  :category_id, #放行進來
                                  :spec )
  end
end

