require './game_extra'
require 'colorize'

# set default player to second player, since it gets swapped back to first player at beginning for while loop
player = 1


# Enter player names
puts "Welcome to math buster"
puts "Player 1, please enter your name: "
@player_name[0] = gets.chomp
puts "Player 2, please enter your name: "
@player_name[1] = gets.chomp
puts "Alright #{@player_name[0]} & #{@player_name[1]}, get ready for Math Buster!"

# Game runs while player life is NOT 0
while @player_life[player] != 0

  # now swap player
  player = swap_player(player)
  puts ""

  # now ask question
  puts @player_name[player].light_blue + " you are up"
  generate_question
  puts @question
  answer = gets.chomp.to_i

  # Verify answer
  if verify_answer(answer)
    @player_points[player] += 1
    puts "You got it! You now have #{@player_points[player]} points.".green
  else
    @player_life[player] -= 1
    puts "WRONG! You have #{@player_life[player]} lives left.".red
  end

  #Ask if player wants to play again
  if @player_life[player] == 0
    puts "#{@player_name[player]} you lose!".red
    ask = play_again?
  end
end




# while player_life(array) != 0 do
#   player = 0
#   Get question
#   ask question
#   get answer
#   if eval answer
#     "You got it!"
#     player_points(player) += 1
#   else
#     "WRONG!"
#     @player_life(player) -= 1
#   end
#   switch player 0 <=> 1
# end


