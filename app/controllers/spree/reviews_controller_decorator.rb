Spree::ReviewsController.class_eval do
  def create
    params[:review][:rating].sub!(/\s*[^0-9]*\z/, '') unless params[:review][:rating].blank?

    @review = Spree::Review.new(review_params)
    @review.product = @product
    @review.user = spree_current_user if spree_user_signed_in?
    @review.ip_address = request.remote_ip
    @review.locale = I18n.locale.to_s if Spree::Reviews::Config[:track_locale]

    authorize! :create, @review
    
    respond_to do |format|
        
      if @review.save
        flash[:notice] = Spree.t(:review_successfully_submitted)
        format.js
      else
        format.html { render 'new' }
        format.js
      end
    end
  end
end