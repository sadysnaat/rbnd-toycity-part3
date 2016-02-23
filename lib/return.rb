class Return
  @@id = 0
  @@returns = []

  def initialize(transaction)
    @transaction = transaction
    @timestamp = Time.now()
    perform_return
    @@returns << self
  end

  private

  def perform_return
    @transaction.product.stock += 1
  end
end
