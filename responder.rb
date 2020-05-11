#レスポンダークラスの作成
class Responder
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  #継承先で定義するならいらないかな
  def response(input)
    "#{input}ってなぁに?"
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
    @responses = ['今日は寒いね','ごめん、ちょっと待って','あ、はい','うるさい','昨日10円ひろった']
  end
  def response(input)
    @responses[rand(@responses.size)]
  end
end
