class AddPositionToSpreePaymentMethods < ActiveRecord::Migration
  def change
    unless column_exists? :spree_payment_methods, :position
      add_column :spree_payment_methods, :position, :integer, default: 0
    end
  end
end
