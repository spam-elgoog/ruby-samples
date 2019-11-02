class String
    def embiggen
       "#{self.upcase}!!!"
    end

    def currency_to_f
        return self.gsub(/[$,]/,"").to_f
    end
 end      
 
puts "Wiggum".embiggen  
puts "$3,000,400.56".currency_to_f.to_s
puts "hello".hash


def alphabetize(arr, rev=false)
    arr.sort!
    (rev == true) ? arr.reverse! : arr
end
  
numbers = [2, 5, 3, 16, 0, 322, -5]
  puts alphabetize(numbers, true)


h = Hash.new(0)
h["HELLO"] = 7
puts h["hello"]