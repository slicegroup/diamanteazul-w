class AddReferenceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_products, :reference, :string
  end
end
