class AddReturnProductsToSpreeWarranties < ActiveRecord::Migration
  def change
    add_column :spree_warranties, :returned_products_ids, :text
  end
end
