class Transaction
  attr_reader :customer, :product, :id

  @@id = 1
  @@transactions = []
  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    perform_transaction
  end

  private

  def perform_transaction
    @product.stock -= 1
  end
end
