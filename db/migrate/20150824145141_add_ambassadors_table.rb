class AddAmbassadorsTable < ActiveRecord::Migration
  def self.up
    create_table :spree_ambassadors do |t|
      t.column  :name, :string
      t.column  :website, :string
      t.column  :home_town, :string
      t.column  :description, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :spree_ambassadors
  end
end

