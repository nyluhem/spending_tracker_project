class Transaction

  attr_accessor(:amount, :transaction_time)
  attr_reader(:id, :merchant_id)


  def initialize(options)
    @id               = options["id"].to_i
    @amount           = options["amount"].to_i
    @merchant_id      = options["merchant_id"].to_i
    @transaction_time = options["transaction_time"]
  end


end
