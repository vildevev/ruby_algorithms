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