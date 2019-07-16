KepplerBanners::Engine.routes.draw do
  namespace :admin do
    scope :banners, as: :banners do
    end
  end
end
