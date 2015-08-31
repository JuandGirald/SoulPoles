Spree::Admin::BlogEntriesController.class_eval do
  before_action :load_image, only: [:new]  

  private
  def load_image
    @images = @blog_entry.images.new
  end
end