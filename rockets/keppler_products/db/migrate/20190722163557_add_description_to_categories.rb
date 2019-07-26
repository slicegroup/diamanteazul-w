class AddDescriptionToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_categories, :description, :text
  end
end
