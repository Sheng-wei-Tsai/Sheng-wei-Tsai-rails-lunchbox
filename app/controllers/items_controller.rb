class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all # select * from ..
  end

  def show
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
      redirect_to items_path, notice: "update your order Successfully"
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'deleted successfully'
  end

  private
  def find_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit( :name,
                                  :description,
                                  :price,
                                  :spec )
  end
end

