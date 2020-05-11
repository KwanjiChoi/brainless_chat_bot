#レスポンダークラスの作成
class Responder
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def responce(input)
    "#{input}ってなぁに?"
  end
end


#人工無脳Unmoクラスの作成
class Unmo
  attr_accessor :name
  def initialize(name)
    @name = name
    @responder = Responder.new('What')
  end

  #ってなぁに?と返すメソッド
  def dialogue(input)
    @responder.responce(input)
  end

  def responder_name
    @responder.name
  end
end


def prompt(unmo)
  unmo.name + ':' + unmo.responder_name + '>'
end

puts 'Unmo System prototype : proto'

proto = Unmo.new('proto')

while true
  print '>'
  input = gets
  input.chomp!
  break if input == ''
  response = proto.dialogue(input)
  puts "#{prompt(proto)} #{response} "
end
