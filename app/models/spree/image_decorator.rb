Spree::Image.class_eval do
  belongs_to :cms_field, class_name: "Spree::CmsField"
  belongs_to :ambassador, class_name: "Spree::Ambassador"
  belongs_to :option_value, class_name: "Spree::OptionValue"
end