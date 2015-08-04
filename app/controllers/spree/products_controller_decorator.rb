Spree::ProductsController.class_eval do
  before_action :load_product,       only: [:show, :edit, :update, :event]
  before_action :load_option_types,  only: [:create]
  before_action :load_styles_images, only: [:new, :create]

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

  def new
    @product    = Spree::Product.new
    @products   = Spree::Product.where(slug: Spree::Product::STYLES)
    
    @top_images = []
    @styles.images.each do |image|
      @top_images << { :url => image.attachment.url(:original) , alt: image.alt }
    end
  end

  #Custome wizard for products
  def create
    if !params[:product_id].blank?
      image          = @styles.images.find_by_alt(params[:alt])
      product_choose = Spree::Product.find(params[:product_id])
      attributes     = product_choose.dup.attributes
      @product       = Spree::Product.new(attributes)
      @product.price = product_choose.price 
      @product.slug  = "#{product_choose.slug}-#{rand(100000000)}"
      @product.option_types << @option_types

      @product_image  = @product.images.new(attachment: image.attachment)
      
    else
      @product = Spree::Product.new
    end

    if @product.next_step
      @product_image.save
      redirect_to wizard_url(@product, @product.state)
    else
      redirect_to new_product_path
    end
  end

  def customize
    event = params[:state]
    @product = Spree::Product.find_by_slug(params[:product_id])
    if params[:state] != @product.state
      @product.send(event)
      redirect_to wizard_url(@product, @product.state)
    end
  end

  def update
    @product.attributes = product_params

    if @product.next_step
      if @product.state == "complete"
        redirect_to product_path(@product)
      else
        redirect_to wizard_path(@product, @product.state)
      end
    else
      render :edit
    end
  end

  private
  def product_params
    if params[:product]
      params[:product].permit(Spree::PermittedAttributes.product_attributes)
    else
      {}
    end
  end

  def load_styles_images
    @styles = Spree::Product.find_by_name("Style Images")
  end

  def load_option_types
    @option_types = Spree::OptionType.where(name: Spree::Product::TYPES)
  end
end