class Responder
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def responce(input)
    puts "#{input}ってなぁに?"
  end
  def name
    @name
  end
end



class Unmo
  attr_accessor :name
  def initialize(name)
    @name = name
    @responder = Responder.new('What')
  end

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
  puts "#{prompt(proto)} #{response}"
end
