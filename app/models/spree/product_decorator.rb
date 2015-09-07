Spree::Product.class_eval do
  STYLES = ['vibrant-soul', 'torched-soul', 'ski-poles-ltd-edition', 'original-soul', 'soullite',
            'ski-poles-torched-soul']
  TYPES  = ['pole-size', 'basket-size', 'pole-color', 'grip-color', 'basket-color', 'tip-color']

  #Product Wizard using the State machine
  state_machine :initial => :new do
    event :next_step do
      transition :new  => :polesize
      transition :polesize => :gripcolor
      transition :gripcolor => :basketsize
      transition :basketsize => :tip
      transition :tip => :engraving
      transition :engraving => :complete
    end

    state :new, :polesize do
      validates_presence_of :slug
    end

    event :polesize do
      transition :gripcolor => :polesize
      transition :basketsize => :polesize
      transition :tip => :polesize
      transition :engraving => :polesize
      transition :complete => :polesize
    end

    event :gripcolor do
      transition :basketsize => :gripcolor
      transition :tip => :gripcolor
      transition :engraving => :gripcolor
      transition :complete => :gripcolor
    end

    event :basketsize do
      transition :tip => :basketsize
      transition :engraving => :basketsize
      transition :complete => :basketsize
    end

    event :tip do
      transition :engraving => :tip
      transition :complete => :tip
    end

    event :engraving do
      transition :complete => :engraving
    end

  end
end