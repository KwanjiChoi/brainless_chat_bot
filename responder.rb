#レスポンダークラスの作成
class Responder
  attr_reader :name
  def initialize(name,dictionary)
    @name = name
    @dictionary = dictionary
  end

  def response(input)
    ''
  end

  private
  def select_random(ary)
    ary[rand(ary.size)]
  end
end

#Unmoでどのclassをnewするかによって処理を変える
class WhatResponder < Responder
  def response(input)
    "#{input}ってなぁに？"
  end
end

class RandomResponder < Responder

  def response(input)
    select_random(@dictionary.random)
  end

end

class PatternResponder < Responder
  def response(input)
    @dictionary.pattern.each do |ptn_item|
      if m = input.match(ptn_item['pattern'])
        resp = select_random(ptn_item['phrases'].split('|'))
        return resp.gsub(/%match%/,m.to_s)
      end
    end
    #正規表現に引っかからなかったらrondomを返す
    return select_random(@dictionary.random)
  end
end
