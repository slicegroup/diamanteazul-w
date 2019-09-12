
# frozen_string_literal: true

require_dependency "keppler_products/application_controller"
module KepplerProducts
  module Admin
    # DesignsController
    class DesignsController < ::Admin::AdminController
      layout 'keppler_products/admin/layouts/application'
      before_action :set_design, only: %i[show edit update destroy]
      before_action :index_variables
      include ObjectQuery

      # GET /products
      def index
        respond_to_formats(@designs)
        redirect_to_index(@objects)
      end

      # GET /products/1
      def show; end

      # GET /products/new
      def new
        @design = Design.new
      end

      # GET /products/1/edit
      def edit; end

      # POST /products
      def create
        @design = Design.new(design_params)

        if @design.save
          redirect(@design, params)
        else
          render :new
        end
      end

      # PATCH/PUT /products/1
      def update
        if @design.update(design_params)
          redirect(@design, params)
        else
          render :edit
        end
      end

      def clone
        @design = Design.clone_record params[:design_id]
        @design.save
        redirect_to_index(@objects)
      end

      # DELETE /products/1
      def destroy
        @design.destroy
        redirect_to_index(@objects)
      end

      def destroy_multiple
        Design.destroy redefine_ids(params[:multiple_ids])
        redirect_to_index(@objects)
      end

      def upload
        Design.upload(params[:file])
        redirect_to_index(@objects)
      end

      def reload; end

      def sort
        Design.sorter(params[:row])
      end

      private

      def index_variables
        @q = Design.ransack(params[:q])
        @designs = @q.result(distinct: true)
        @objects = @designs.page(@current_page).order(position: :asc)
        @total = @designs.size
        @attributes = Design.index_attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_design
        @design = Design.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def design_params
        params.require(:design).permit(
          :url
        )
      end
    end
  end
end
