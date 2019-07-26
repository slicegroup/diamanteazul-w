# This migration comes from keppler_products (originally 20190722125454)
class AddColumnImageToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_categories, :image, :string
  end
end
