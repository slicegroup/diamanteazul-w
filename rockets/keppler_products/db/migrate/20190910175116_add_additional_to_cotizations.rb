class AddAdditionalToCotizations < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_cotizations, :additional, :text
  end
end
