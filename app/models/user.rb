class User


  def initialize(options)
    @id             = options["id"].to_i
    @name           = options["name"]
    @email_address  = options["email_address"]
    @transaction_id = options["transaction_id"].to_i

  end


end
