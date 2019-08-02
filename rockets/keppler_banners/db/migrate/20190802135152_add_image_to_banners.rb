class AddImageToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_banners_banners, :image, :string
  end
end
