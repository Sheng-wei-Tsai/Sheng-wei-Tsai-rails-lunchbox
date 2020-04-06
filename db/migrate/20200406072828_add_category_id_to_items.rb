class AddCategoryIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :category_id, :integer
  end
end

# category has_many :items
# item belons_to :category 
     # :category_id
