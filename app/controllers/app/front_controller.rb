module App
  # FrontsController
  class FrontController < AppController
    layout 'app/layouts/application'
    before_action :set_categories_parents, except: [:index, :catalogue]
    before_action :set_category, except: [:index, :products]
    def index
      @banners = KepplerBanners::Banner.all
    end

    def about
    end

    def catalogue
      if params[:q]
        @categories = KepplerProducts::Category.set_parents
        .ransack(name_cont: params[:q])
        .result
      else
        set_categories_parents
      end
    end

    def category
      @category = KepplerProducts::Category.find(params[:id])
      if params[:q]
        @subcategories = KepplerProducts::Category.filter_by_parent(@category.id)
        .ransack(name_cont: params[:q])
        .result
      else
        @subcategories = @category.children
      end
    end

    def subcategory
      @subcategory = KepplerProducts::Category.find(params[:id])
      if params[:q]
        @subcategories = KepplerProducts::Category.filter_by_parent(@subcategory.id)
        .ransack(name_cont: params[:q])
        .result
      else
        @subcategories = @subcategory.children
      end
    end

    def products
    end

    def product
    end

    private

    def set_categories_parents
      @categories = KepplerProducts::Category.set_parents
    end

    def set_category
      @category = KepplerProducts::Category.new
    end

  end
end
