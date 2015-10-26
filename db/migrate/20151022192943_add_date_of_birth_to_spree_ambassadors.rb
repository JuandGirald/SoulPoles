class AddDateOfBirthToSpreeAmbassadors < ActiveRecord::Migration
  def change
    add_column :spree_ambassadors, :date_of_birth, :date
  end
end
