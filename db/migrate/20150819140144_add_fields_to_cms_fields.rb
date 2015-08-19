class AddFieldsToCmsFields < ActiveRecord::Migration
  def change
    add_column :spree_cms_fields, :is_banner, :boolean, default: false
    add_column :spree_cms_fields, :is_slider, :boolean, default: false
  end
end
