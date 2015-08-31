Spree::Admin::PagesController.class_eval do
  before_action :load_image, only: [:new, :edit]  

  private
  def load_image
    @images = @page.images.new(alt: 'profile')
  end
end