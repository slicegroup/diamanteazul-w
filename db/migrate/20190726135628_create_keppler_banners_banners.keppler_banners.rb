# This migration comes from keppler_banners (originally 20190726135517)
class CreateKepplerBannersBanners < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_banners_banners do |t|
      t.string :title
      t.string :subtitle
      t.boolean :cta
      t.string :link
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
