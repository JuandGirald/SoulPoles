class Spree::WorkshopsController < Spree::StoreController
  layout '/spree/layouts/ambassador'
  
  def index
    @workshops = Spree::Product.where(is_workshop: true)
  end

  def show
    @workshop = Spree::Product.find(params[:id])
  end
end