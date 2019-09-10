class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_products, :price, :string
  end
end
