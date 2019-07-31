class CreateKepplerProductsCotizations < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_products_cotizations do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.string :product_id
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
