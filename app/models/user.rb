class User < ApplicationRecord
  # 虛擬欄位
  attr_accessor :password_confirm

  validates :email, presence: true
  validates :password, presence: true
end
