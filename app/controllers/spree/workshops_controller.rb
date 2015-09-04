class Spree::WorkshopsController < Spree::StoreController
  layout '/spree/layouts/home'
  
  def index
    @workshops = Spree::Product.where(is_workshop: true)
  end

  def show
    @workshop = Spree::Product.friendly.find(params[:id])
    @product_properties = @workshop.product_properties.includes(:property)
  end
end