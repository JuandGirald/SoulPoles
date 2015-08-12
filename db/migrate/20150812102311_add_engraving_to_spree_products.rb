class AddEngravingToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :custom_engraving, :string
  end
end
