require("minitest/autorun")
require("minitest/rg")
require_relative("../transaction")

class TestTransaction < MiniTest::Test

  def setup
    @transaction_1 = Transaction.new({
      "amount" => 12,
      "merchant_id" => 1,
      "transaction_time" => Time.now,
      "tag_id" => 1
      })
  end

  def test_transaction_has_amount
    assert_equal(12, @transaction_1.amount)
  end

  def test_transaction_has_merchant_id
    assert_equal(1, @transaction_1.merchant_id)
  end

  def test_transaction_has_transaction_time
    p time = Time.now
    p @transaction_1.transaction_time
    assert_equal(time, @transaction_1.transaction_time)
  end

  def test_transaction_has_tag_id
    assert_equal(1, @transaction_1.tag_id)
  end

  p transactions.total

end
