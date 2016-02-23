class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.string :condition
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :products, [:user_id, :created_at]
  end
end
