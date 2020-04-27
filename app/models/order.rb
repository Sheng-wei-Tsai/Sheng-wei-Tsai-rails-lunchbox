class Order < ApplicationRecord
  include AASM
  attr_reader :nonce

  has_many :order_items
  belongs_to :user
  

  before_create :create_order_num

  aasm column: 'state' do
    state :pending, initial: true
    state :paid, :delivered, :cancelled

    event :pay do
      transitions from: :pending, to: :paid

      after_transaction do
        puts "-" * 10
        puts "發送簡訊"
        puts "-" * 10
      end
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end

    event :cancel do
      transitions from: [:pending, :paid], to: :cancelled
    end
  end  

  
  
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
