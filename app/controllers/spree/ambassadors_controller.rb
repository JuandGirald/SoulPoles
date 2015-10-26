class Spree::AmbassadorsController < Spree::StoreController
  layout '/spree/layouts/ambassador'

  def index
    @ambassadors = Spree::Ambassador.all
  end

  def show
    @ambassador = Spree::Ambassador.find(params[:id])
  end
end
