require 'minitest/autorun'

class BrainlessTest < Minitest::Test
  def test_sample
    assert_equal 'RUBY','ruby'.upcase
  end
end
