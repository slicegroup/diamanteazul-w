class CreateKepplerProductsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_products_categories do |t|
      t.string :name
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
