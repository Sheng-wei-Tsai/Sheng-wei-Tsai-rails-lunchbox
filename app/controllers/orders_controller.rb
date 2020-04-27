class OrdersController < ApplicationController

  def create
    # @order = Order.new(order_params)
    # @order.user = current_user = 下面那行
    @order = current_user.orders.build(order_params) # 以使用者的角度來看
    if @order.save

    else

    end







    render html: params
  end



  private

  def order_params
    params.require(:order).permit(:receiver, :phone, :address)
  end
end
