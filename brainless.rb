require './responder.rb'


#人工無脳Unmoクラスの作成
class Unmo
  attr_accessor :name
  def initialize(name)
    @name = name
    @responder = RandomResponder.new('What')
  end

  #ってなぁに?と返すメソッド
  def dialogue(input)
    @responder.response(input)
  end

  def responder_name
    @responder.name
  end
end
