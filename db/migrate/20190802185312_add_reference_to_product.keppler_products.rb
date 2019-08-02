# This migration comes from keppler_products (originally 20190802185143)
class AddReferenceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_products, :reference, :string
  end
end
