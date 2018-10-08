require_relative("../db/sql_runner.rb")

class Transaction

  attr_accessor(:amount, :merchant_id, :tag_id, :description)
  attr_reader(:id, :transaction_time)


  def initialize(options)
    @id               = options["id"].to_i
    @amount           = options["amount"]
    @description      = options["description"]
    @merchant_id      = options["merchant_id"].to_i
    @transaction_time = Time.now.strftime("%H:%M %d-%m-%y")
    @tag_id           = options["tag_id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM  transactions;"
    results = SqlRunner.run(sql)
    transaction_objects = results.map {|transaction| Transaction.new(transaction)}
    return transaction_objects
  end

  def save
    sql = "INSERT into transactions (
    amount,
    description,
    merchant_id,
    tag_id,
    transaction_time
    )
    VALUES ($1, $2, $3, $4, $5)
    RETURNING id;"
    values = [
      @amount,
      @description,
      @merchant_id,
      @tag_id,
      @transaction_time
    ]
    result = SqlRunner.run(sql, values)
    result_hash = result[0]
    string_id = result_hash["id"]
    id = string_id.to_i
    @id = id
  end

  def update
    sql = "UPDATE transactions
    SET (
      amount,
      description,
      merchant_id,
      tag_id,
      transation_time
      ) = ($1, $2, $3, $4, $5)
      WHERE id = $6;"

      values = [
        @amount,
        @merchant_id,
        @tag_id,
        @transaction_time,
        @id
      ]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1;"
    results = SqlRunner.run(sql, [id])
    return Transaction.new(results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM transactions
    WHERE id = $1;"
    SqlRunner.run(sql, [id])
  end

  def merchant
    sql = "SELECT * FROM merchants
    WHERE id = $1;"

    result = SqlRunner.run(sql, [@merchant_id])
    merchant_hash = result[0]
    merchant = Merchant.new(merchant_hash)
    return merchant
  end

  def tag
    sql = "SELECT * FROM tags
    WHERE id = $1;"

    result = SqlRunner.run(sql, [@tag_id])
    tag_hash = result[0]
    tag = Tag.new(tag_hash)
    return tag
  end

end
