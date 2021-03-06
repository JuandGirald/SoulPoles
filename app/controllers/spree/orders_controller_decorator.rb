Spree::OrdersController.class_eval do

  before_action :apply_coupon_code
  # Adds a new item to the order (creating a new order if none already exists)
  def populate
    if params[:product_id]
      @product = Spree::Product.find(params[:product_id])
      @product.attributes = product_params
      @product.update_attributes(:is_custom => true)
      @product.next_step
    end
    order    = current_order(create_order_if_necessary: true)
    variant  = Spree::Variant.find(params[:variant_id])
    quantity = params[:quantity].to_i
    options  = params[:options] || {}
    variant.update(:engraving => params[:engraving], :workshop_date => params[:date])
    
    # 2,147,483,647 is crazy. See issue #2695.
    if quantity.between?(1, 2_147_483_647)
      begin
        order.contents.add(variant, quantity, options)
      rescue ActiveRecord::RecordInvalid => e
        error = e.record.errors.full_messages.join(", ")
      end
    else
      error = Spree.t(:please_enter_reasonable_quantity)
    end

    if error
      flash[:error] = error
      redirect_back_or_default(spree.root_path)
    else
      respond_with(order) do |format|
        format.html { redirect_to cart_path }
      end
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
end
