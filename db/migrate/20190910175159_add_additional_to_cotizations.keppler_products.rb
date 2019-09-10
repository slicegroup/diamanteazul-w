# This migration comes from keppler_products (originally 20190910175116)
class AddAdditionalToCotizations < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_cotizations, :additional, :text
  end
end
