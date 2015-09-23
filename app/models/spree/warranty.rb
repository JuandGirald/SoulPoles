class Spree::Warranty < ActiveRecord::Base
  serialize :returned_products_ids
  validates_presence_of :first_name, :reason, :returned_products_ids

  belongs_to :order
end