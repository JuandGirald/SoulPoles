Spree::BlogEntry.class_eval do
  has_one :blog_entry_image, :as => :viewable, :dependent => :destroy, :class_name => 'Spree::BlogEntryImage'
  accepts_nested_attributes_for :blog_entry_image, :reject_if => :all_blank
end
