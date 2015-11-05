class AddFieldsToSpreeCmsFields < ActiveRecord::Migration
  def change
    add_column :spree_cms_fields, :category_top, :boolean, default: false
    add_column :spree_cms_fields, :category_bottom, :boolean, default: false
  end
end
