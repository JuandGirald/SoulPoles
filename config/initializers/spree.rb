# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# Note: If a preference is set here it will be stored within the cache & database upon initialization.
#       Just removing an entry from this initializer will not make the preference value go away.
#       Instead you must either set a new value or remove entry, clear cache, and remove database entry.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  country = Spree::Country.find_by_iso("US")
  config.default_country_id = country.id if country.present?

  config.logo = "spree_50.png"
end if Spree::Country.table_exists?

Spree::Config[:track_inventory_levels] = false

Spree::PermittedAttributes.product_attributes << [
  :pole_size, :basket_size, :grip_left, :grip_right, 
  :basket_left, :basket_right, :tip_right, :tip_left, 
  :is_custom, :custom_engraving, :is_workshop, :engraving_font,
  :pole_style
]

SpreeEditor::Config.tap do |config|
  config.current_editor = 'CKEditor'
  config.ids = 'product_product_properties_attributes_1_value 
                product_product_properties_attributes_0_value
                product_product_properties_attributes_2_value
                product_product_properties_attributes_3_value
                product_product_properties_attributes_4_value
                product_product_properties_attributes_5_value
                product_description page_body event_body
                blog_entry_body
                cms_content_area
                ambassador_description_area'

end

Spree.user_class = "Spree::User"

attachment_config = {

  s3_credentials: {
    access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    bucket:            ENV['S3_BUCKET_NAME']
  },

  storage:        :s3,
  s3_headers:     { "Cache-Control" => "max-age=31557600" },
  s3_protocol:    "https",
  bucket:         ENV['S3_BUCKET_NAME'],
  url:            ":s3_domain_url",

  styles: {
    mini:     "48x48>",
    small:    "100x100>",
    product:  "240x240>",
    large:    "600x600>"
  },

  path:           "/:class/:id/:style/:basename.:extension",
  default_url:    "/:class/:id/:style/:basename.:extension",
  default_style:  "product"
}

attachment_config.each do |key, value|
  Spree::Image.attachment_definitions[:attachment][key.to_sym] = value
end
