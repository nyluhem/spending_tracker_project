require_relative("../db/sql_runner.rb")

class Transaction

  attr_accessor(:amount, :transaction_time, :merchant_id, :tag_id)
  attr_reader(:id)


  def initialize(options)
    @id               = options["id"].to_i
    @amount           = options["amount"].to_i
    @merchant_id      = options["merchant_id"].to_i
    @transaction_time = options["transaction_time"]
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
    merchant_id,
    transaction_time,
    tag_id
    )
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    values = [
      @amount,
      @merchant_id,
      @transaction_time,
      @tag_id
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
      merchant_id,
      transaction_time,
      tag_id
      ) = ($1, $2, $3, $4)
      WHERE id = $5;"

      values = [
        @amount,
        @merchant_id,
        @transaction_time,
        @tag_id,
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
