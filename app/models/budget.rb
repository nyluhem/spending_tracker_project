require_relative("../db/sql_runner.rb")

class Budget

  attr_accessor(:tag_id, :budget_limit, :budget_cushion)
  attr_reader(:id)

  def initialize(options)
    @id = options["id"].to_i
    @tag_id = options["tag_id"].to_i
    @budget_limit = options["budget_limit"]
    @budget_cushion = options["budget_cushion"]
  end

  def self.delete_all
    sql - "DELETE FROM budgets;"
    SqlRunner.run(sql)
  end


  def self.all
    sql = "SELECT * FROM budgets;"
    result = SqlRunner.run(sql)
    budgets = result.map {|budget| Budget.new(budget)}
    return budgets
  end

  def save
    sql = "INSERT INTO budgets
      (tag_id,
        budget_limit,
        budget_cushion
        )
        VALUES ($1, $2, $3)
        RETURNING id;"

        values = [
          @tag_id,
          @budget_limit,
          @budget_cushion
        ]

        result = SqlRunner.run(sql, values)
        result_hash = result[0]
        string_id = result_hash["id"]
        id = string_id.to_i
  end

  def update
    sql = "UPDATE budgets
      SET (
        tag_id,
        budget_limit,
        budget_cushion
          ) = ($1, $2, $3)
          WHERE id = $4;"

      values = [
        @tag_id,
        @budget_limit,
        @budget_cushion,
        @id
      ]

      SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM budgets
    WHERE id = $1;"
    results = SqlRunner.run(sql, [id])
    return Budget.new(results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM budgets
    WHERE id = $1;"
    SqlRunner.run(sql, [id])
  end

  def tag_name
    sql = "SELECT * FROM tags
    WHERE id = $1;"

    result = SqlRunner.run(sql, [@tag_id])
    tag_hash = result[0]
    tag = Tag.new(tag_hash)
    return tag.name
  end


end
