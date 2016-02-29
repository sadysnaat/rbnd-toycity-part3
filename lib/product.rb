class Product
  attr_reader :title, :price, :stock, :brand
  attr_writer :stock

  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    @brand = options[:brand]
    add_to_products
  end

  def self.all
    @@products
  end

  def self.in_stock
    @@products.select { |product| product.in_stock? }
  end

  def in_stock?
    @stock > 0
  end


  def self.find_by_title(title)
    @@products.each do |product|
      if product.title == title
        return product
      end
    end
  end

  # since product title is unique
  def ==(another_product)
    self.title == another_product.title && self.class == another_product.class
  end

  private

  def add_to_products
    all_products = @@products.map { |product| product.title }
    if all_products.include? @title
      raise DuplicateProductError, "'#{self.title}' already exists."
    end
    @@products << self
  end

end
