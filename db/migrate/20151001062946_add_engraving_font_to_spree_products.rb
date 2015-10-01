class AddEngravingFontToSpreeProducts < ActiveRecord::Migration
  def change
    add_column :spree_products, :engraving_font, :string
  end
end
