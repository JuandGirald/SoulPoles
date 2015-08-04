Spree::Product.class_eval do
  STYLES = ['vibrant-soul', 'torched-soul', 'limited-edition', 'original-soul', 'soullite']
  TYPES  = ['pole-size', 'basket-size', 'pole-color', 'grip-color', 'basket-color']

  #Product Wizard using the State machine
  state_machine :initial => :new do
    event :next_step do
      transition :new  => :polesize
      transition :polesize => :gripcolor
      transition :gripcolor => :basketsize
      transition :basketsize => :strapcolor
      transition :strapcolor => :tip
      transition :tip => :engraving
      transition :engraving => :complete
    end

    state :new, :polesize do
      validates_presence_of :slug
    end

    event :polesize do
      transition :gripcolor => :polesize
      transition :basketsize => :polesize
      transition :strapcolor => :polesize
      transition :tip => :polesize
      transition :engraving => :polesize
      transition :complete => :polesize
    end

    event :gripcolor do
      transition :basketsize => :gripcolor
      transition :strapcolor => :gripcolor
      transition :tip => :gripcolor
      transition :engraving => :gripcolor
      transition :complete => :gripcolor
    end

    event :basketsize do
      transition :strapcolor => :basketsize
      transition :tip => :basketsize
      transition :engraving => :basketsize
      transition :complete => :basketsize
    end

    event :strapcolor do
      transition :tip => :strapcolor
      transition :engraving => :strapcolor
      transition :complete => :strapcolor
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