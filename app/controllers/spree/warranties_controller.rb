class Spree::WarrantiesController < Spree::StoreController
  before_filter :ensure_order_has_shipped_units, only: [:new, :create]
  before_filter :check_authorization, only: [:new, :create, :labels]
  before_filter :load_order, only: [:new, :create]

  
  def create
    @warranty = Spree::Warranty.new(permitted_params)
    # @return_authorization.being_submitted_by_client = true
    @warranty.order = @order
    @warranty.status = 'pending'
    
    if @warranty.save
      # Spree::ReturnAuthorizationMailer.contains_exchange(@return_authorization).deliver if @return_authorization.contains_an_exchange?

      # @message = SpreeReturnRequests::Config[:return_request_success_text]
      render :success
      return
    end

    render :new
  end

  def new
    @warranty = Spree::Warranty.new(order: @order)
    # @return_authorization.being_submitted_by_client = true
  end

  def search
    @errors = []

    if params.include?(:order)
      @errors << "Order Number is required." unless params[:order][:order_number].present?
      @errors << "Email Address is required." unless params[:order][:email_address].present?

      if params[:order][:order_number].present? && params[:order][:email_address].present?
        order = Spree::Order.where(number: params[:order][:order_number].strip, email: params[:order][:email_address].strip).first

        if order
          redirect_to(new_order_warranty_path(order))
        else
          @errors << "Order not found."
        end
      end
    end
  end

  private
    def load_order
      @order = Spree::Order.find_by_number(params[:order_id])
    end

    def ensure_order_has_shipped_units
      @order = Spree::Order.find_by_number(params[:order_id])
      unless @order.shipped?
        @error = Spree.t(:return_requests_order_must_be_shipped)
        render :error
        return
      end
    end

    def check_authorization
      session[:access_token] = params[:token] if params[:token]
      begin
        @order = Spree::Order.find_by_number(params[:order_id])
        authorize! :read, @order, session[:access_token]
      rescue
        flash[:error] = "You do not have access to this order."
        redirect_to(warranties_search_path) && return
      end
    end

    def permitted_params
      params.require(:warranty).permit(:first_name, :order_id, :reason, :last_name, :returned_products_ids, :comments)
    end
end