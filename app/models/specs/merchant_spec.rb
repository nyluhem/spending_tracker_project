require("minitest/autorun")
require("minitest/rg")
require_relative("../merchant.rb")

class TestMerchant < MiniTest::Test

  def setup
    @merchant_1 = Merchant.new ({
      "name" => "Amazon"
      })
  end

  def test_merchant_has_name
    assert_equal("Amazon", @merchant_1.name)
  end

end
