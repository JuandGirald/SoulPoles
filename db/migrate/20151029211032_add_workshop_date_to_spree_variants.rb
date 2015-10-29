class AddWorkshopDateToSpreeVariants < ActiveRecord::Migration
  def change
    add_column :spree_variants, :workshop_date, :date
  end
end
