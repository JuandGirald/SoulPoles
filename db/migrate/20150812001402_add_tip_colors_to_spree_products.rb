class AddTipColorsToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :tip_right, :string
    add_column :spree_products, :tip_left, :string
  end
end
