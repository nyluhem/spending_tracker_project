class Merchant

  attr_accessor(:name)
  attr_reader(:id)


  def initialize(options)
    @id   = options["id"].to_i
    @name = options["name"]
  end


end
