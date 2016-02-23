class Transaction
  attr_reader :customer, :product, :id

  @@id = 1
  @@transactions = []
  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    @timestamp = Time.now()
    perform_transaction
    @@transactions << self
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
  end

  private

  def perform_transaction
    if @product.stock < 1
      raise OutOfStockError, "'#{@product.title}' is out of stock."
    else
      @product.stock -= 1
    end
  end
end
