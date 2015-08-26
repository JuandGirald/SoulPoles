Spree::OptionValue.class_eval do
  has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::Image"

  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => :all_blank

  def has_image?
    image_file_name && !image_file_name.empty?
  end

  default_scope { order("#{quoted_table_name}.position") }
  scope :for_product, lambda { |product| select("DISTINCT #{table_name}.*").where("spree_option_value_variants.variant_id IN (?)", product.variant_ids).joins(:variants) }
end