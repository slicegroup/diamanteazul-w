# This migration comes from keppler_banners (originally 20190802135152)
class AddImageToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_banners_banners, :image, :string
  end
end
