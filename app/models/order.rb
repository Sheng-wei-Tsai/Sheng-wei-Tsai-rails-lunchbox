class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  before_create :create_order_num
  
  private

  def create_order_num
    self.order_num = num_generator
  end

  def num_generator
    #實作內容
    # p Date.new(today)
    year = Date.today.year
    month = Date.today.month
    day = Date.today.day
  
     code = [*0..9, *'A'..'Z'].sample(6).join
  
  # ex: 20200427A14WEF
  "#{year}#{"%02d" % month}#{"%02d" % day }#{code}"
    
  end

end
