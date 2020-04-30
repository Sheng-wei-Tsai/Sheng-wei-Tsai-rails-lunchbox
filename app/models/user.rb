class User < ApplicationRecord
  has_secure_password


  # 虛擬欄位(可讀可寫的方法) 本生沒有 password_confirm 欄位
  validates :email, presence: true, 
                    uniqueness: true
                    
  validates :password, presence: true,
                        confirmation: true,
                        length: { minimum: 4 }

  has_many :histories
  has_many :events, through: :histories
  has_many :comments

  has_many :favorite_items
  has_many :items, through: :favorite_items
  
  has_many :orders

  def displayname
    self.nickname == "" ? self.email : self.nickname
  end

end

