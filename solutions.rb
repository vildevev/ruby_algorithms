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