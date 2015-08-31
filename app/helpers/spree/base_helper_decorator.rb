Spree::BaseHelper.module_eval do
  def nav_variables
    @pages = Spree::Page.all
  end
end