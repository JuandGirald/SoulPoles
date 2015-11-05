class AddPoleStyleToProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :pole_style, :string
  end
end
