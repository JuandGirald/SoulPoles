Spree::HomeController.class_eval do
  layout '/spree/layouts/home'

  def index
    @searcher = build_searcher(params.merge(include_images: true))
    @products = @searcher.retrieve_products
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    @sliders = Spree::CmsField.find_by(is_slider: true)
    @banner = Spree::CmsField.find_by(is_banner: true)
  end
end