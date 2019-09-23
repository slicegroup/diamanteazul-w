module App
  # FrontsController
  class FrontController < AppController
    layout 'app/layouts/application'
    before_action :set_categories_parents, except: [:catalogue]
    before_action :set_category, except: [:index, :products, :product]
    before_action :set_product, only: [:send_cotization]
    before_action :recaptcha_cotization, only: [:send_cotization]
    before_action :recaptcha_message, only: [:send_message]
    def index
      @banners = KepplerBanners::Banner.all
    end

    def about
      @category_url = KepplerProducts::Design.first&.url
    end

    def catalogue
      @catalogue = KepplerProducts::Catalogue.first
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
      @cotization = KepplerProducts::Cotization.new
    end

    def send_cotization
      @cotization = KepplerProducts::Cotization.new(cotization_params.merge(
        product_id: params[:id]))
      include_info_additional if !@product&.price.present?
      if @cotization.save
        flash[:notice] = "Mensaje enviado"
        send_mailer
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

    def send_mailer
      if @product&.price.present?
        ContactMailer.shopy_client(@cotization, @product).deliver_now
      else
        ContactMailer.cotization_admin(@cotization, @product).deliver_now
      end
    end

    def set_product
      @product = KepplerProducts::Product.find(params[:id])
    end

    def recaptcha_cotization
      return if verify_recaptcha(model: @cotization, timeout: 10, message: "Oh! It's error with reCAPTCHA!")
      redirect_back fallback_location: :root_path
    end

    def recaptcha_message
      return if verify_recaptcha(model: @message, timeout: 10, message: "Oh! It's error with reCAPTCHA!")
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

    def include_info_additional
      additional = 'Caracteristicas adicionales: '
      additional << params[:additional].keys.join(', ').gsub('-', ' ').titlecase
      additional << '<br>' + params[:content]
      @cotization.additional = additional
    end

  end
end
