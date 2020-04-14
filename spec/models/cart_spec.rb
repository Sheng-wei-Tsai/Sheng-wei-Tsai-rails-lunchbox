require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "基本功能" do
    it "可以把商品丟到購物車中，然後購物車裡就有東西了" do
      # Arrange
      cart = Cart.new
      # Act
      cart.add_item(1)
      # Assert
      expect(cart.empty?).to be false  
    end

    it "加了相同種類的商品到購物車裡，購買項目（CartItem）並不會增加，但商品的數量會改變" do
      cart = Cart.new 

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      # Arrange (安排購物車還有商品)
      cart = Cart.new
      # cat1 = Category.create(name: 'Cat1')
      # cat1 = FactoryBot.create(:category)
      i1 = FactoryBot.create(:item)
      i2 = FactoryBot.create(:item)
      # i1 = cat1.items.create(name: 'item1', price: 100 )
      # i2 = cat1.items.create(name: 'item2', price: 90 )
      # Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }
      # Asset
      expect(cart.items.first.item).to be_an Item  #測他是不是個物件
      expect(cart.items.first.item.price).to be i1.price #測試是不是 價錢 
    end

    it "可以計算整台購物車的總消費金額" do
      # Arrange (安排購物車還有商品)
      cart = Cart.new
      
      i1 = FactoryBot.create(:item, price: 50)
      i2 = FactoryBot.create(:item, price: 100)

      # Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }
      # Asset
      expect(cart.total).to be 350
    end

    it "特別活動可搭配折扣" do
      # 4/1 全館打 1 折
      # Arrange
      cart = Cart.new

      i1 = FactoryBot.create(:item, price: 50)
      i2 = FactoryBot.create(:item, price: 100)
      
      # Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      t = Time.local(2008, 4, 1, 10, 5, 0)
      Timecop.travel(t)

      # Assert
      expect(cart.total).to be 35.0
    end

  end

  describe "進階功能" do
    it "可以將購物車內容轉換成 Hash 並存到 Session 裡" do
      # Arrange
      cart = Cart.new

      i1 = FactoryBot.create(:item, price: 50)
      i2 = FactoryBot.create(:item, price: 100)
      
      # Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }
      result = {
        "items" => [
          { "item_id" => 1 , "quantity" => 3},
          { "item_id" => 2 , "quantity" => 2}       
        ]
      }
      #Assert
      expect(cart.to_hash).to eq result 
    end 

    it "還原成購物車的內容" do
      # Arrage 
      result = {
        "items" => [
          { "item_id" => 1 , "quantity" => 3},
          { "item_id" => 2 , "quantity" => 2}       
        ]
      }
      # Act
      cart = Cart.from_hash(result)

      # Assert
      expect(cart.items.count).to be 2

    end
  end
end

