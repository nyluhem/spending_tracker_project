require("minitest/autorun")
require("minitest/rg")
require_relative("../tag.rb")

class TestTag < MiniTest::Test
  def setup
    @tag_1 = Tag.new({
      "name" => "Clothes"
      })
  end

  def test_tag_has_name
    assert_equal("Clothes", @tag_1.name)
  end
end
