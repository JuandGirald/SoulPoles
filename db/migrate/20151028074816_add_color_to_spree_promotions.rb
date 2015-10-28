class AddColorToSpreePromotions < ActiveRecord::Migration
  def change
    add_column :spree_promotions, :color, :string
  end
end
