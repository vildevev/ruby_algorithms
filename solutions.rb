def balanced?(string) 
  valid_syntax = {'{' => '}', '[' => ']', '(' => ')'} 
  has_appeared = []
  
  string.each_char do |char| 
    if valid_syntax[has_appeared[-1]] == char 
      has_appeared.pop
    else 
      has_appeared.push(char)
    end 
  end 
  has_appeared.empty?
end 

# Runtime complexity: O(n)
# Space complexity: O(n)

# You are given a list of integers, e.g.
# [1, 3, 2, 0, 5, 2, 8, 2]

# Given a start index in the list, you “win” by landing on a zero, where you move by jumping through the array either left or right the number of spaces (value) specified at the index you are currently looking at. 

def can_win?(array, start_index)
  # Check if array contain any zeros
  contains_zero = false 
  array.each do |num|
    if num == 0 
      contains_zero = true 
    end 
  end 
  # Impossible to win if it doesn't, make function return false 
  return false if !contains_zero
  
  possible_indeces = [start_index]
  have_visited = Hash.new 
  loop do 
    possible_indeces.each do |index|
      have_visited[index] = 0 
      return true if array[index] == 0 
    end
    possible_indeces = possible_moves(possible_indeces, array)
    possible_indeces.each do |i| 
      if have_visited[i]
        possible_indeces.delete(i)
      end 
    end 
    return false if possible_indeces.empty? 
  end 
end 

def possible_moves(indeces_arr, arr)
  moves = []
  # Checking for all the possible indeces 
  indeces_arr.each do |index|
    # Determines if it's possible to move right
    if index + arr[index] < arr.length 
      moves.push(index+= arr[index])
    end 
    # Determines if it's possible to move left
    if index - arr[index] > -1 
      moves.push(index-=arr[index])
    end 
  end 
  moves 
end 
  
can_win?([2,0,7,0,2], 2)  


# The exercise here is to write a function that takes a single argument (a
# list of names) and returns a string representing the English-formatted
# conjunction of those names.
#
# For example, given these names: ['Alice', 'Bob', 'Carlos', 'Diana']
#
# The output would be: "Alice, Bob, Carlos and Diana"
#
# This type of function is useful when building user interfaces that show the
# list of people in a conversation, for example.

# 1. create empty string 
# 2. iterate through, not last element inside while loop
# 3. add "and" and last element 

# Now lets write a function that takes an array and an argument called `limit`. This controls the maximum number of 
# names that should be displayed.  Any remaining items are "summarized" using the
# string "and # more".
#
# For example, given these names: ['Alice', 'Bob', 'Carlos', 'Diana'] and limit: 2
#
# The output would be: "Alice, Bob and 2 more"
def to_string_with_commas(array, limit = nil) 
  return "" if array.empty? 
  return array[0] if array.length == 1
  
  if limit && limit > 0 && limit < array.length  
    leftovers = array.length - limit 
    return array[0..(limit-1)].join(', ') + ' and ' + leftovers.to_s + ' more'
  end 


  array[0..-2].join(', ') + ' and ' + array[-1]
end 


test_array = ["alice", "lee", 'another', "caroline"]
test_array2 = ["alice", "parker"]

puts(to_string_with_commas(test_array, 3))
puts(to_string_with_commas(test_array, 2))
puts(to_string_with_commas(test_array, 0))
puts(to_string_with_commas(test_array2, 1))
puts(to_string_with_commas(['alice'], 0))
puts(to_string_with_commas([]))

