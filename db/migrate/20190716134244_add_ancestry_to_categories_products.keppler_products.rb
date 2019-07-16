# This migration comes from keppler_products (originally 20190716133823)
class AddAncestryToCategoriesProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_categories, :ancestry, :string
    add_index :keppler_products_categories, :ancestry
  end
end
