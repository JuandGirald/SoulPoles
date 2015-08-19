class AddCmsFieldsToAdminPanel < ActiveRecord::Migration
  def self.up
    create_table :spree_cms_fields do |t|
      t.string :product_title
    end
  end

  def self.down
    drop_table :spree_cms_fields
  end
end
