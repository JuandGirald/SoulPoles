class SpreeRolesUsers < ActiveRecord::Migration
  create_table :spree_roles_users, :id => false do |t|
      t.references :role
      t.references :user
    end

  add_index :spree_roles_users, [:role_id], :name => 'index_spree_roles_users_on_role_id'
  add_index :spree_roles_users, [:user_id], :name => 'index_spree_roles_users_on_user_id'
end
