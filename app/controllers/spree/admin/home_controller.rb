module Spree
  module Admin
    class HomeController < Spree::Admin::BaseController

      def index
       @cms_fields = Spree::CmsField.all 
      end

      def new
        @cms_field = Spree::CmsField.new
        @images = @cms_field.images.new
      end

      def edit
        @cms_field = Spree::CmsField.find_by_id(params[:id])
        @images = @cms_field.images.new
      end

      def create
        @cms_fields =  Spree::CmsField.new(cms_field_params)
        
        if @cms_fields.save
          redirect_to admin_home_index_path
        end
      end

      def update
        @cms_field = Spree::CmsField.find_by_id(params[:id])
        @cms_field.update_attributes(cms_field_params)
        redirect_to admin_home_index_path
      end

      def destroy
        @cms_field = Spree::CmsField.friendly.find(params[:id])
        @cms_field.destroy

        flash[:success] = Spree.t('notice_messages.home_fields_deleted')

        respond_with(@product) do |format|
          format.html { redirect_to admin_home_index_path }
          format.js  { render_js_for_destroy }
        end
      end

      private
        def cms_field_params
          params.require(:cms_field).permit(:product_title, :is_banner, :is_slider,
                                            :images_attributes => [:id, :attachment, :_destroy])
        end
    end
  end
end