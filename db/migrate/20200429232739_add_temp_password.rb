class AddTempPassword < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :temp_password, :string
  end
end
