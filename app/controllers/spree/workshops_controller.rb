class Spree::WorkshopsController < Spree::StoreController
  layout '/spree/layouts/home'
  
  def index
    @workshops = Spree::Product.where(is_workshop: true)
  end

  def show
    @workshop = Spree::Product.find(params[:id])
  end
end