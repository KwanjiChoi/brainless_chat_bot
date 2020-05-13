require './responder.rb'


#人工無脳Unmoクラスの作成
class Unmo
  attr_accessor :name
  def initialize(name)
    @name = name
    @what_responder = WhatResponder.new('what')
    @rand_responder = RandomResponder.new('Random')
    @responder = @rand_responder
  end

  #responderが受け取るクラスによってと返す言葉が変わる
  def dialogue(input)
    @responder = rand(2) == 0 ? @what_responder : @rand_responder
    #responseを返すメソッド
    @responder.response(input)
  end

end
