class Return
  @@id = 0
  @@returns = []

  def initialize(transaction)
    #Return requires a transaction against which return is being made
    @id = @@id
    @transaction = transaction
    @timestamp = Time.now()
    perform_return
    @@returns << self
    @@id += 1
  end

  private

  def perform_return
    @transaction.product.stock += 1
  end
end
