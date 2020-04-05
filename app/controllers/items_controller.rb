class ItemsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, 
            with: :active_record_not_found 

  def index
    @items = Item.all # select * from ..
  end

  def show
    @item = Item.find(params[:id]) 
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

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: 'deleted successfully'
  end

  private
  def item_params
    params.require(:item).permit( :name,
                                  :description,
                                  :price,
                                  :spec )
  end

  def active_record_not_found
    render  file: 'public/404.html', 
            status: 404,
            layout: false
  end


end
