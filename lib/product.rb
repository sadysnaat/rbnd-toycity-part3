class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
    @title = options[:title]
    add_to_products
  end

  def self.all
    @@products
  end

  private

  def add_to_products
    all_products = @@products.map { |product| product.title }
    if all_products.include? @title
      raise DuplicateProductError
    end
    @@products << self
  end

end
