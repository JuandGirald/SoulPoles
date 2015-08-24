module Spree
  module Admin
    class AmbassadorsController < Spree::Admin::ResourceController
    before_action :load_image, only: [:new, :edit]  

    private
    def load_image
      @images = @ambassador.images.new(alt: 'profile')
    end
    end
  end
end