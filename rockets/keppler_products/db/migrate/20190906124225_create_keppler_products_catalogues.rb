class CreateKepplerProductsCatalogues < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_products_catalogues do |t|
      t.string :banner
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
