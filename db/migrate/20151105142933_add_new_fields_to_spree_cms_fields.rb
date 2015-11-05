class AddNewFieldsToSpreeCmsFields < ActiveRecord::Migration
  def change
    add_column :spree_cms_fields, :bottom_content, :text
    add_column :spree_cms_fields, :category, :string
  end
end
