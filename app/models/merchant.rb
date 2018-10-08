require_relative("../db/sql_runner.rb")

class Merchant

  attr_accessor(:name, :time_added)
  attr_reader(:id)


  def initialize(options)
    @id   = options["id"].to_i
    @name = options["name"]
    @time_added = Time.now.strftime("%H:%M %d-%m-%y")
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

  def tag_name
    sql = "SELECT tags.name
          FROM tags
          INNER JOIN transactions
          ON transactions.tag_id = tags.id
          WHERE merchant_id = $1;"

        results = SqlRunner.run(sql,[@id])
        tags = results.map {|tag| Tag.new(tag)}
        return tags
  end

end
