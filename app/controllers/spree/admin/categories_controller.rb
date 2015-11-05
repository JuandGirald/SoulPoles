module Spree
  module Admin
    class CategoriesController < Spree::Admin::BaseController

      def index
       @cms_fields = Spree::CmsField.where(is_banner: false, is_slider: false)
      end

      def new
        @cms_field = Spree::CmsField.new
        @images = @cms_field.images.new
      end

      def edit
        @cms_field = Spree::CmsField.find_by_id(params[:id])
      end

      def create
        @cms_fields =  Spree::CmsField.new(cms_field_params)
        
        if @cms_fields.save
          redirect_to admin_categories_path
        end
      end

      def update
        @cms_field = Spree::CmsField.find_by_id(params[:id])
        @cms_field.update_attributes(cms_field_params)
        redirect_to admin_categories_path
      end

      def destroy
        @cms_field = Spree::CmsField.find_by_id(params[:id])
        @cms_field.destroy

        flash[:success] = Spree.t('notice_messages.home_fields_deleted')

        respond_with(@product) do |format|
          format.html { redirect_to admin_categories_path }
          format.js  { render_js_for_destroy }
        end
      end

      private
        def cms_field_params
          params.require(:cms_field).permit(:product_title, :content, :bottom_content, :category,
                                            :images_attributes => [:id, :attachment, :alt, :_destroy])
        end
    end
  end
end
