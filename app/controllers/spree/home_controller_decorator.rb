Spree::HomeController.class_eval do
  layout '/spree/layouts/home'
  before_action :load_cupon_bar

  def index
    @searcher   = build_searcher(params.merge(include_images: true))
    @products   = @searcher.retrieve_products.where(is_custom: false)
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    @sliders    = Spree::CmsField.find_by(is_slider: true)
    @banner     = Spree::CmsField.find_by(is_banner: true)
    @instagram  = Instagram.tag_recent_media('soulpoles')
  end

  def apply_coupon_bar
    @order = current_order
    if @order.promotions.any?
      flash[:error] = "Your current order already has a coupon applied"
      redirect_back_or_default(spree.root_path)
    else
      @order.coupon_code = @cupon_bar.code

      handler = Spree::PromotionHandler::Coupon.new(@order).apply

      if handler.error.present?
        flash.now[:error] = handler.error
        respond_with(@order) { |format| format.html { render :edit } } and return
      elsif handler.success
        flash[:success] = handler.success
      end
      # current_order.promotions << @cupon_bar
      # flash[:success] = "Your coupon has been applied to your current order!"
      redirect_back_or_default(spree.root_path)
    end
  end

  private
    def load_cupon_bar
      @cupon_bar = Spree::Promotion.find_by_name("cupon bar")
    end
end
