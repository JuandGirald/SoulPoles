class AddEngravingToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :engraving, :text
  end
end
