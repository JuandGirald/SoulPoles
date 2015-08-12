class AddIsCustomToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :is_custom, :boolean, default: false
  end
end
