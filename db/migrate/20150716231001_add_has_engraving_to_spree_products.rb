class AddHasEngravingToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :has_engraving, :boolean, default: false
  end
end
