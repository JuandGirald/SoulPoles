class Spree::AmbassadorsController < Spree::StoreController
  layout '/spree/layouts/ambassador'

  def index
    @ambassadors = Spree::Ambassador.all
  end

  def show
    @ambassadors = Spree::Ambassador.all
    @ambassador = Spree::Ambassador.find(params[:id])
  end
end
