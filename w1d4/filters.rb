# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
 
 
def find(x)
  if @candidates.any? {|h| h[:id] == x}
    return @candidates.find {|h| h[:id] == x}
  else
    return "ID does not exist".red
  end
end



def experienced?(x)
 x[:years_of_experience] > 2
end

def hundredpoints?
  x[:github_points] > 100
end

def ruby_or_python?(x)
  x[:languages].include?("Ruby" || "Python")
end

def last_15_days?(x)
  x[:date_applied] > 15.days.ago.to_date
end

def over_17?(x)
  x[:age] > 17
end

def ordered_by_qualifications(cans)
  array = []
  cans = cans.sort_by {|x| [x[:years_of_experience], x[:github_points]] }
  cans = cans.reverse
  cans.each do |x| 
    if experienced?(x) && ruby_or_python?(x) && last_15_days?(x) && over_17?(x)
      array << x
    else
      array << x
    end
  end
  array
end

def qualified_candidates(cans)
  array = []
  cans.each do |x| 
    if experienced?(x) && ruby_or_python?(x) && last_15_days?(x) && over_17?(x)
      array << x
    else
    end
  end
  array
end

def qualified_color(cans)
  cans.each do |x| 
    if experienced?(x) && ruby_or_python?(x) && last_15_days?(x) && over_17?(x)
      puts x.to_s.green
    else
      puts x.to_s.red
    end
  end
end
# More methods will go below