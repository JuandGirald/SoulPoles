class CreateSpreeWarrantyTable < ActiveRecord::Migration
  def change
    create_table :spree_warranties do |t|
      t.references :order, index: true
      t.string :first_name
      t.string :last_name
      t.string :reason
      t.string :comments
      t.timestamp :submitted_at
      t.string :status

      t.timestamps
    end
  end
end
