Spree::Admin::ProductsController.class_eval do
  def index
    session[:return_to] = request.url
    @collection = @collection.where(is_custom: false)
    respond_with(@collection)
  end
end
