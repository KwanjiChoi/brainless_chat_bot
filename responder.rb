#レスポンダークラスの作成
class Responder
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

#Unmoでどのclassをnewするかによって処理を変える
class WhatResponder < Responder
  def response(input)
    "#{input}ってなぁに？"
  end
end

class RandomResponder < Responder
  def initialize(name)
    super
    @phrases = []
    #ファイルからランダムな反応を取ってくる
    open('disc/random.txt') do |f|
      f.each do |line|
        line.chomp!
        next if line.empty?
        @phrases << line
      end
    end
  end

  def response(input)
    select_random(@phrases)
  end

  private
  def select_random(ary)
    ary[rand(ary.size)]
  end

end
