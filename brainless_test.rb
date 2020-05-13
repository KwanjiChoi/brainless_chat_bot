require 'minitest/autorun'
require './responder.rb'
require './brainless.rb'
class BrainlessTest < Minitest::Test
  def test_sample
    res = WhatResponder.new('what')
    assert_equal 'RUBY','ruby'.upcase
    assert_equal res.response("こんにちは"),"こんにちはってなぁに？"
  end
end
