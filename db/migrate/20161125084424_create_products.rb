class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      # t.string :name
      # t.decimal :price
      # t.string :size
      # t.int :category
      # t.string :image

      t.column :name,  :string
      t.column :price, :decimal, precision: 10, scale: 2
      t.column :size, :string
      t.column :category, :integer
      t.column :image, :string

      t.timestamps
    end
  end
end
