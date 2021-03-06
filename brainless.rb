require './responder.rb'
require './dictionary.rb'

#人工無脳Unmoクラスの作成

class Unmo
  attr_reader :name
  def initialize(name)
    @name = name

    @dictionary = Dictionary.new

    @resp_what = WhatResponder.new('What', @dictionary)
    @resp_random = RandomResponder.new('Random', @dictionary)
    @resp_pattern = PatternResponder.new('Pattern', @dictionary)
    @responder = @resp_pattern
  end

  def dialogue(input)
    case rand(100)
    when 0..79
      @responder = @resp_pattern
    when 80..94
      @responder = @resp_random
    else
      @responder = @resp_what
    end
    return @responder.response(input)
  end

  def responder_name
    return @responder.name
  end

end
