Spree::ProductsController.class_eval do
  before_action :load_product, only: [:show, :edit]

  def show
    @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
    @product_properties = @product.product_properties.includes(:property)
    @taxon = Spree::Taxon.find(params[:taxon_id]) if params[:taxon_id]
    redirect_if_legacy_path
    @review = Spree::Review.new(product: @product)
  end

  def edit
    @line_item = Spree::LineItem.find(params[:line_item])
    @variants = @product.variants_including_master.active(current_currency).includes([:option_values, :images])
    @product_properties = @product.product_properties.includes(:property)
    @taxon = Spree::Taxon.find(params[:taxon_id]) if params[:taxon_id]
    
    respond_to do |format|
      format.js
      format.html
    end
  end


  def update
    variant  = Spree::Variant.find(params[:variant_id])
    line_item = Spree::LineItem.find(params[:line_item_id])

    if params[:engraving].nil? or params[:engraving].empty?
      engraving = line_item.variant.engraving
    else
      engraving = params[:engraving]
    end

    line_item.update(:variant_id => variant.id)
    line_item.variant.update(:engraving => engraving)
    
    respond_to do |format|
      format.html { redirect_to cart_path }
    end
  end
end