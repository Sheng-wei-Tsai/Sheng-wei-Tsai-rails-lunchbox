class Cart 
  attr_reader :items
  def initialize
    @items = []
  end 

  def add_item(item_id)
    # 檢查 陣列裡面有沒有我們要的 cart_item
    found_item = @items.find {|item| item.item_id == item_id }
    #                            cart_item(上的id)  
    # found.class => CartItem 你是誰生出來的
    if found_item
      # 增加數量
      found_item.increment! 
    else
      # 找不到 創造一個給他
      @items << CartItem.new(item_id)
    end

  end

  def empty?
    @items.empty?
  end
  
  def total
    result = @items.sum { |item| item.total }
    if Time.now.month == 4 and Time.now.day == 1
      result = result * 0.1
    end

    return result
    # @items.reduce(0) { |sum, item| sum + item.total }
    # tmp = 0
    # @items.each do |item|
    #   tmp += item.total
    # end
    #
    # return tmp
  end
  
  def to_hash
    # items = [
    #   { "item_id" => 1 , "quantity" => 1},
    #   { "item_id" => 2 , "quantity" => 2}       
    # ]
    # items = []
    # @items.each do |item|
    #   items << {  "item_id" => item.item_id,
    #               "quantity" => item.quantity }
    # end
    items = @items.map { |item| 
    {"item_id" => item.item_id, "quantity" => item.quantity}
  }
    return { "items" => items }
  end

end



