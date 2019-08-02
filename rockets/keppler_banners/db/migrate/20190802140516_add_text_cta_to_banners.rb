class AddTextCtaToBanners < ActiveRecord::Migration[5.2]
  def change
    add_column :keppler_banners_banners, :cta_text, :string
  end
end
