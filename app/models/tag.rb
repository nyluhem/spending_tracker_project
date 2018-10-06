require_relative("../db/sql_runner.rb")

class Tag

  attr_accessor(:name)
  attr_reader(:id)


  def initialize(options)
    @id   = options["id"].to_i
    @name = options["name"]
  end

  def self.delete_all
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM tags;"
    result = SqlRunner.run(sql)
    tag_objects = result.map {|tag| Tag.new(tag)}
    return tag_objects
  end

  def save
    sql = "INSERT INTO tags (
    name
    )
    VALUES ($1)
    RETURNING id;"

    values = [@name]

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
