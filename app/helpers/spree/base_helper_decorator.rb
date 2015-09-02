Spree::BaseHelper.module_eval do
  def nav_variables
    @pages = Spree::Page.all
  end

  def load_taxons
    @taxons = Spree::Taxonomy.includes(root: :children)
  end
end