# CartItem.new(3, 1)
# CartItem.new(3)
# 多考慮預設值

class CartItem
  attr_reader :item_id, :quantity
  #在外部希望可以讀取 

  def initialize(item_id, quantity = 1)
    @item_id = item_id
    @quantity = quantity
  end

  def increment!(amount = 1 )
    @quantity += amount 
  end

  def item
    Item.find(@item_id)
  end

  def total
    item.price * @quantity 
  end

  
end