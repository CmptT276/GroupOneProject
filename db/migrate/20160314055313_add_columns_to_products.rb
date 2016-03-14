class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :category_id, :string
    add_column :products, :—force, :string
  end
end
