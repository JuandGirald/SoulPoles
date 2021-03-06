Spree::Product.class_eval do
  STYLES = ['vibrant-soul', 'ski-poles-ltd-edition', 'original-soul', 'soullite',
            'ski-poles-torched-soul', 'torched-soul', 'ski-poles-soullite']
  TYPES  = ['pole-size', 'basket-size', 'pole-color', 'grip-color', 'basket-color', 'tip-color', 'engraving-fonts']

  #Product Wizard using the State machine
  state_machine :initial => :new do
    event :next_step do
      transition :new  => :size
      transition :size => :gripcolor
      transition :gripcolor => :basket
      transition :basket => :engraving
      transition :engraving => :complete
    end

    state :new, :size do
      validates_presence_of :slug
    end

    event :size do
      transition :gripcolor => :size
      transition :basket => :size
      # transition :tip => :size
      transition :engraving => :size
      transition :complete => :size
    end

    event :gripcolor do
      transition :basket => :gripcolor
      # transition :tip => :gripcolor
      transition :engraving => :gripcolor
      transition :complete => :gripcolor
    end

    event :basket do
      # transition :tip => :basket
      transition :engraving => :basket
      transition :complete => :basket
    end

    # event :tip do
    #   transition :engraving => :tip
    #   transition :complete => :tip
    # end

    event :engraving do
      transition :complete => :engraving
    end

  end
end
