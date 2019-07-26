class AddBannerToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_products_categories, :banner, :string
  end
end
