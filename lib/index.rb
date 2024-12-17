require_relative 'game'
require_relative 'computer'

game = Game.new
choice = game.take_choice
puts 'Colors to choose from red, blue, green, orange, yellow and brown'
puts 'Please enter colors separated by comma (,) and space'
if choice == 'guess'
  (1..12).each do |_i|
    guess = game.take_choice
    if game.win?( guess )
      puts 'Congratulations, you won!'
      break
    end
    puts game.feedback( guess ).join( ' ' )
  end
  puts 'Sorry, you lost!' unless game.won
else
  code = game.take_code
  game = Game.new( code )
  computer = Computer.new
  feedback = []
  ( 1..12 ).each do |_i|
    guess = computer.guess( feedback )
    p guess
    if game.win?( guess )
      puts 'Computer won!'
      break
    end
    feedback = game.feedback( guess )
    puts game.feedback( guess ).join( ' ' )
  end
  puts 'Computer lost!' unless game.won
end
