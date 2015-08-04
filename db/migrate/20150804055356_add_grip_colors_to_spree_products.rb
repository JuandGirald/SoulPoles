class AddGripColorsToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :grip_left, :string
    add_column :spree_products, :grip_right, :string
  end
end
