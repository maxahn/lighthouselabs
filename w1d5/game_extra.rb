
@player_life = [3, 3]
@player_name = []
@player_points = [0, 0]
@nums = []
@question = ""
@answer = 0

def generate_question
  nums = [(1 + rand(10)), (1 + rand(10))]
  syms = [:+, :-, :*, :/]
  sym = syms.sample
  @answer = nums[0].send(sym, nums[1])
  @question = "What is #{nums[0]} #{sym} #{nums[1]}?"
end


def verify_answer(answer)
  @answer == answer  
end

def play_again?
  puts "Do you want to play again? yes/no"
  answer = gets.chomp.downcase
  if answer == "yes"
    @player_life = [3, 3]
    return true
  else
    return false
  end
end

def swap_player(player)
  if player == 0
   player = 1
  else
    player = 0
  end
end