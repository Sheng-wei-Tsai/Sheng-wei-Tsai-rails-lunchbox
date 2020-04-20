class AddDeletedAtToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :deleted_at, :datetime
    # 增加新的欄位
    add_index :items, :deleted_at
    # 加索引 有跟動就會加快搜尋時間，用印碟空間換讀取時間
    # 大部分都是查詢多(收尋次數多)

  end
end
