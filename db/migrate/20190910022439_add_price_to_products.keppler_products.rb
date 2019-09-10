# This migration comes from keppler_products (originally 20190910021932)
class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_products, :price, :string
  end
end
