require_relative("../db/sql_runner.rb")

class User

attr_accessor(:name, :email_address)
attr_reader(:id, :transaction_id)


  def initialize(options)
    @id             = options["id"].to_i
    @name           = options["name"]
    @email_address  = options["email_address"]
    @transaction_id = options["transaction_id"].to_i

  end

  def self.delete_all
    sql = "DELETE FROM users;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM users;"
    result = SqlRunner.run(sql)
    user_objects = result.map {|user| User.new(user)}
    return user_objects
  end

  def save
    sql = "INSERT into users (
    name,
    email_address,
    transaction_id,
    )
    VALUES ($1, $2, $3)
    RETURNING id;"

    values = [
      @name,
      @email_address,
      @transaction_id
    ]
    result = SqlRunner.run(sql, values)
    result_hash = result[0]
    string_id = result_hash["id"]
    id = string_id.to_i
    @id = id
  end

  def update
  end

  def self.find(id)
  end

  def self.delete(id)
  end

end
