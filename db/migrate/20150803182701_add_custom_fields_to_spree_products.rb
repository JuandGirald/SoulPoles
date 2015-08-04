class AddCustomFieldsToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :pole_size, :string
    add_column :spree_products, :grip_color, :string
    add_column :spree_products, :basket_size, :string
    add_column :spree_products, :strap_color, :string
    add_column :spree_products, :basket_color, :string
  end
end
