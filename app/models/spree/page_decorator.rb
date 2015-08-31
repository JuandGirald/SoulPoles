Spree::Page.class_eval do
  has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::Image"

  accepts_nested_attributes_for :images, :allow_destroy => true
end