class User < ApplicationRecord
  # 虛擬欄位(可讀可寫的方法) 本生沒有 password_confirm 欄位
  validates :email, presence: true, 
                    uniqueness: true
                    
  validates :password, presence: true,
                        confirmation: true,
                        length: { minimum: 6 }
end
