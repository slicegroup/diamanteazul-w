# This migration comes from keppler_products (originally 20190911190317)
class CreateKepplerProductsDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_products_designs do |t|
      t.string :url
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
