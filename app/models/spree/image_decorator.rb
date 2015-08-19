Spree::Image.class_eval do
  belongs_to :cms_field, class_name: "Spree::CmsField"
end