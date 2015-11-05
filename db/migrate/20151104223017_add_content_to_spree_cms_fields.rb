class AddContentToSpreeCmsFields < ActiveRecord::Migration
  def change
    add_column :spree_cms_fields, :content, :text
  end
end
