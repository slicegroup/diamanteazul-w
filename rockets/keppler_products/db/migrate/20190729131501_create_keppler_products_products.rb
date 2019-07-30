class CreateKepplerProductsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_products_products do |t|
      t.string :name
      t.string :category_id
      t.text :description
      t.string :tags
      t.jsonb :images
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
