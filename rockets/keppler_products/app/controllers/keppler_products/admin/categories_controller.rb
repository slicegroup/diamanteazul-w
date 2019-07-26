
# frozen_string_literal: true

require_dependency "keppler_products/application_controller"
module KepplerProducts
  module Admin
    # CategoriesController
    class CategoriesController < ::Admin::AdminController
      layout 'keppler_products/admin/layouts/application'
      before_action :set_category, only: %i[show edit update destroy]
      before_action :index_variables
      before_action :check_parent, only: %i[create]
      include ObjectQuery

      # GET /products
      def index
        respond_to_formats(@categories)
        redirect_to_index(@objects)
      end

      # GET /products/1
      def show; end

      # GET /products/new
      def new
        if params[:parent]
          @parent = Category.find(params[:parent])
        end
        @category = Category.new
      end

      # GET /products/1/edit
      def edit; end

      # POST /products
      def create
        @category = Category.new(category_params)

        if @category.save
          redirect(@category, params)
        else
          render :new
        end
      end

      # PATCH/PUT /products/1
      def update
        if @category.update(category_params)
          redirect(@category, params)
        else
          render :edit
        end
      end

      def clone
        @category = Category.clone_record params[:category_id]
        @category.save
        redirect_to_index(@objects)
      end

      # DELETE /products/1
      def destroy
        @category.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Category.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Category.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Category.sorter(params[:row])
      end

      private

      def check_parent
        if params[:parent]
          parent = Category.find(params[:parent])
          @category = parent.children.create(
            name: params[:category][:name],
            image: params[:category][:image],
            image: params[:category][:banner],
            description: params[:category][:description])
          custom_redirect
        end
      end

      def custom_redirect
        if params[:_add_other]
          redirect_to new_admin_products_category_path(parent: params[:parent])
        else
          redirect_to admin_products_category_path(@category)
        end
      end

      def index_variables
        @q = Category.set_parents.ransack(params[:q])
        @categories = @q.result(distinct: true)
        @objects = @categories.page(@current_page).order(position: :asc)
        @total = @categories.size
        @attributes = Category.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(
          :name, :image, :description, :banner
        )
      end
    end
  end
end
