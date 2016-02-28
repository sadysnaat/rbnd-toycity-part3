class Customer
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def purchase(product)
    transaction = Transaction.new(self, product)
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.each do |customer|
      if customer.name == name
        return customer
      end
    end
    raise CustomerNotFoundError, "No customer with name '#{name}'."
  end

  private

  def add_to_customers
    all_customers = @@customers.map { |customer| customer.name }
    if all_customers.include? @name
      raise DuplicateCustomerError, "'#{@name}' already exists."
    end
    @@customers << self
  end
end
