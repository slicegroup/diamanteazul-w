module App
  # FrontsController
  class FrontController < AppController
    layout 'app/layouts/application'
    before_action :set_categories_parents, except: [:catalogue]
    before_action :set_category, except: [:index, :products, :product]
    before_action :validate_recaptcha, only: [:send_cotization, :send_message]
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
      @category = KepplerProducts::Category.find(params[:id])
      if params[:q]
        @products = @category.products.ransack(name_cont: params[:q]).result.page(params[:page])
      else
        @products = @category.products.page(params[:page])
      end
    end

    def product
      @category = KepplerProducts::Category.find(params[:id])
      @product = KepplerProducts::Product.find(params[:product_id])
    end

    def send_cotization
      @cotization = KepplerProducts::Cotization.new(cotization_params.merge(
        product_id: params[:id]))
      if @cotization.save
        flash[:notice] = "Mensaje enviado"
      else
        flash[:notice] = "Mensaje no enviado"
      end
      redirect_back(fallback_location: :root_path)
    end

    def send_message
      @message = KepplerContactUs::Message.new(message_params)
      if @message.save
        flash[:notice] = "Mensaje enviado"
      else
        flash[:notice] = "Mensaje no enviado"
      end
      redirect_back(fallback_location: :root_path)
    end

    def contact
      @message = KepplerContactUs::Message.new
    end

    private

    def validate_recaptcha
      return if verify_recaptcha(model: @reservation, timeout: 10, message: "Oh! It's error with reCAPTCHA!")
      redirect_back fallback_location: :root_path
    end

    def set_categories_parents
      @categories = KepplerProducts::Category.set_parents
    end

    def set_category
      @category = KepplerProducts::Category.new
    end

    def cotization_params
      params.require(:cotization).permit(
        :name, :email, :phone, :message
      )
    end

    def message_params
      params.require(:message).permit(
        :name, :from_email, :subject, :content
      )
    end

  end
end
