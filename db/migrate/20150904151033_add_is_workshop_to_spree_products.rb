class AddIsWorkshopToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :is_workshop, :boolean
  end
end
