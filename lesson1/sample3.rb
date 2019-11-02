movies = {
  "1942": 3.2,
  "Grease": 3.6,
  "Lionking": 3.7
}

puts "Enter your choice (add, update, display, delete):"
choice = gets.chomp.downcase

case choice
  when "add"
    puts "Enter a movie title to add:"
    title = gets.chomp.capitalize
    if movies[title.to_sym] == nil
       puts "Enter the rating:"
       rating = gets.chomp.to_i
       movies[title.to_sym] = rating
    elsif
       puts "Movie already in the database!"
    end 
      
  when "update"
    puts "Updated!"
  when "display"
    puts "Movies!"
  when "delete"
    puts "Deleted!"
  else
    puts "Error!"
end


puts movies
puts "Movie : #{movies[title.to_sym]}"