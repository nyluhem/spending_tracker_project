class Transaction


  def initialize(options)
    @id               = options["id"].to_i
    @amount           = options["amount"].to_i
    @merchant_id      = options["merchant_id"].to_i
    @transaction_time = options["transaction_time"]
  end


end
