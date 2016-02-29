class Brand
  attr_reader :name

  @@brands = []

  def initialize(options={})
    @name = options[:name]
    add_to_brands
  end

  def ==(another_brand)
    self.name == another_brand.name && self.class == another_brand.class
  end

  private

  def add_to_brands
    all_brands = @@brands.map { |brand| brand.name }
    all_brands.each do |brand|
      if @name == brand
        raise DuplicateBrandError, "#{self.name} already exists."
      end
    end
    @@brands << self
  end
end
