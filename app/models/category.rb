class Category < ApplicationRecord
  validates :name, presence: true

  has_many :items

end

# items 
# items= 
# items_create
# items_build 

