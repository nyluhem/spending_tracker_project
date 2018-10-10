require_relative("../db/sql_runner.rb")

class Merchant

  attr_accessor(:name, :time_added)
  attr_reader(:id)


  def initialize(options)
    @id   = options["id"].to_i
    @name = options["name"]
    @time_added = options["time_added"] == nil ? Time.new.strftime("%H:%M %d-%m-%y") : options["time_added"]
  end

  def self.delete_all
    sql = "DELETE FROM merchants;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM merchants;"
    result = SqlRunner.run(sql)
    merchants = result.map {|merchant| Merchant.new(merchant)}
    return merchants
  end

  def save
    sql = "INSERT INTO merchants
    (name,
    time_added)
      VALUES ($1, $2)
      RETURNING id;"

      values = [@name, @time_added]

      result = SqlRunner.run(sql, values)
      result_hash = result[0]
      string_id = result_hash["id"]
      id = string_id.to_i
      @id = id
  end

  def update
    sql = "UPDATE merchants
    SET (name, time_added) = ($1, $2)
      WHERE id = $3;"

      values = [
        @name,
        @time_added,
        @id
      ]
      SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM merchants
    WHERE id = $1;"
    results = SqlRunner.run(sql, [id])
    return Merchant.new(results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM merchants
    WHERE id = $1;"
    SqlRunner.run(sql, [id])
  end

  def tags
    sql = "SELECT *
          FROM tags
          INNER JOIN transactions
          ON transactions.tag_id = tags.id
          WHERE merchant_id = $1;"

        results = SqlRunner.run(sql,[@id])
        tags = results.map {|tag| Tag.new(tag)}
        return tags
  end

  def get_tag_names()
    tag_names = []
    for tag in tags()
      tag_names << tag.name
    end
    return tag_names.uniq
  end

  def transactions
    sql = "SELECT transactions.*
        FROM transactions
        INNER JOIN merchants
        ON transactions.merchant_id = merchants.id
        WHERE merchants.id = $1;"

      merchant_hash = SqlRunner.run(sql,[@id])
      merchants = merchant_hash.map {|merchant| Transaction.new(merchant)}
      return merchants
  end

  def total
    sql = "SELECT transactions.amount::numeric
        FROM transactions
        INNER JOIN merchants
        ON transactions.merchant_id = merchants.id
        WHERE merchants.id = $1;"

      results = SqlRunner.run(sql, [@id])
      amounts = results.map{|result| result["amount"].to_f}
      total = amounts.sum
      final_total = "$#{total}"
  end





end
