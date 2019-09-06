
# frozen_string_literal: true

require_dependency "keppler_products/application_controller"
module KepplerProducts
  module Admin
    # CataloguesController
    class CataloguesController < ::Admin::AdminController
      layout 'keppler_products/admin/layouts/application'
      before_action :set_catalogue, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /products
      def index
        respond_to_formats(@catalogues)
        redirect_to_index(@objects)
      end

      # GET /products/1
      def show; end

      # GET /products/new
      def new
        @catalogue = Catalogue.new
      end

      # GET /products/1/edit
      def edit; end

      # POST /products
      def create
        @catalogue = Catalogue.new(catalogue_params)

        if @catalogue.save
          redirect(@catalogue, params)
        else
          render :new
        end
      end

      # PATCH/PUT /products/1
      def update
        if @catalogue.update(catalogue_params)
          redirect(@catalogue, params)
        else
          render :edit
        end
      end

      def clone
        @catalogue = Catalogue.clone_record params[:catalogue_id]
        @catalogue.save
        redirect_to_index(@objects)
      end

      # DELETE /products/1
      def destroy
        @catalogue.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Catalogue.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Catalogue.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Catalogue.sorter(params[:row])
      end

      private

      def index_variables
        @q = Catalogue.ransack(params[:q])
        @catalogues = @q.result(distinct: true)
        @objects = @catalogues.page(@current_page).order(position: :asc)
        @total = @catalogues.size
        @attributes = Catalogue.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_catalogue
        @catalogue = Catalogue.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def catalogue_params
        params.require(:catalogue).permit(
          :banner
        )
      end
    end
  end
end
