Spree::ProductsController.class_eval do
  before_action :load_product,       only: [:show, :edit, :update, :event]
  before_action :load_option_types,  only: [:create, :edit_inspired]
  before_action :load_styles_images, only: [:new, :create]
  before_action :get_inspired,       only: [:new, :customize, :show_inspired]

  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products.where(is_custom: false)
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end

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
  end

  #Custome wizard for products
  def create
    if !params[:product_id].blank?
      image          = @styles.images.first
      product_choose = Spree::Product.find(params[:product_id])
      attributes     = product_choose.dup.attributes
      @product       = Spree::Product.new(attributes)
      @product.price = product_choose.price 
      @product.name  = params[:alt]
      @product.slug  = "#{product_choose.slug}-#{rand(100000000)}"
      @product.option_types << @option_types

      @product_image  = @product.images.new(attachment: image.attachment)
      
    else
      @product = Spree::Product.new
    end

    if @product.next_step
      redirect_to wizard_path(@product, @product.state)
    else
      redirect_to new_product_path
      flash[:error] = "chose a pole style first"
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
        @product.update_attributes(:is_custom => true)
        redirect_to product_path(@product)
      else
        redirect_to wizard_path(@product, @product.state)
      end
    else
      render :edit
    end
  end

  def destroy
    @product = Spree::Product.friendly.find(params[:id])
    @product.destroy

    flash[:success] = Spree.t('notice_messages.product_deleted')

    respond_with(@product) do |format|
      format.html { redirect_to new_product_path }
      format.js  { render_js_for_destroy }
    end
  end

  # Update products in the shopping cart
  def update_cart
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

  def show_inspired
    @product = Spree::Product.friendly.find(params[:id])
  end

  def edit_inspired
    @product = Spree::Product.friendly.find(params[:id])
    if @product
      image              = @product.images.first
      slug               = @product.slug.gsub(/\d+/, "")
      attributes         = @product.dup.attributes
      @new_product       = Spree::Product.new(attributes)
      @new_product.price = @product.price 
      @new_product.slug      = "#{slug}#{rand(100000000)}"
      @new_product.option_types << @option_types

      @product_image  = @new_product.images.new(attachment: image.attachment)
    end
    
    if @new_product.next_step
      redirect_to wizard_path(@new_product, 'polesize')
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

  def get_inspired
    @inspired = Spree::Product.where(:is_custom => true)
  end

  def load_styles_images
    @styles = Spree::Product.find_by_name("Style Images")
  end

  def load_option_types
    @option_types = Spree::OptionType.where(name: Spree::Product::TYPES)
  end
end
