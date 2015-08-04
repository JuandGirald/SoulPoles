class AddBasketColorsToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :basket_left, :string
    add_column :spree_products, :basket_right, :string
  end
end
