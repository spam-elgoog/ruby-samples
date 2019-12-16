@totals= []
@has_double = false
@save_it = false
failed = []
numbers = (108457...562041).select do |num|
  largest = 0.to_s
  last = ''
  before_last = ''
  build = ''
  @has_double = false
  @strong_double = false
  num.to_s
  num.to_s.chars.each_with_index do |char, index|
    if char >= largest
      largest = char
      build << char
      if char != last && @has_double
        @strong_double = true
      end
      if @has_double
        if before_last == char && char == last
          @has_double = false
        end
      else 
        if last == char 
          @has_double = true
          
          if  char == before_last
            @has_double = false
          end
        end
      end
    else
      failed << num
      break
    end
    before_last = last 
    last = char
  end
  @save_it = (@has_double && build.length == 6 || @strong_double == true && build.length == 6)
  failed << num unless @save_it
  @save_it
end
p numbers
p numbers.length
# p failed
