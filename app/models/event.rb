class Event < ApplicationRecord
  has_many :histories
  has_many :users, throught: :histories
end
