class Transaction
  attr_reader :customer, :product, :id

  @@id = 1
  @@transactions = []
  def initialize(customer, product)
    @id = @@id
    @customer = customer
    @product = product
    @timestamp = Time.now()
    perform_transaction
    @@transactions << self
    @@id += 1
  end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.each do |transaction|
      if transaction.id == id
        return transaction
      end
    end
    raise TransactionNotFoundError, "Transaction with id:#{id} not found."
  end

  # Functions below return an array as multiple transactions
  # may match the criteria

  def self.find_by_customer(customer)
    @@transactions.select do |transaction|
      transaction.customer == customer
    end
  end

  def self.find_by_product(product)
    @@transactions.select do |transaction|
      transaction.product == product
    end
  end

  def self.find_by_brand(brand)
    @@transactions.select do |transaction|
      transaction.product.brand == brand
    end
  end

  private

  def perform_transaction
    if @product.stock < 1 # Check availability of product
      raise OutOfStockError, "'#{@product.title}' is out of stock."
    else
      @product.stock -= 1
    end
  end
end
