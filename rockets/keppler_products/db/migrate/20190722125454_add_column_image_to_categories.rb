class AddColumnImageToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_categories, :image, :string
  end
end
