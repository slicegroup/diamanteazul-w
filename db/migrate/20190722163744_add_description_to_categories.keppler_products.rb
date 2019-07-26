# This migration comes from keppler_products (originally 20190722163557)
class AddDescriptionToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_categories, :description, :text
  end
end
