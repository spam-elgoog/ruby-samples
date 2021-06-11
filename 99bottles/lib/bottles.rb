
class Bottles
  attr_reader :line

  def verse(line)
    @line = line
    # "#{line_number} bottles of beer on the wall, #{line_number} bottles of beer\."
    # "Take one down and pass it around, #{line_number - 1} bottles of beer on the wall\."
    
    first_part = <<~VERSE
    #{bottles(line).capitalize} of beer on the wall, #{bottles(line)} of beer\.
    VERSE
    second_part = if line > 0
      <<~VERSE
      Take #{it_or_one(line)} down and pass it around, #{bottles(line - 1)} of beer on the wall\.
      VERSE
    else  
      <<~VERSE
      Go to the store and buy some more, 99 bottles of beer on the wall\.
      VERSE
    end
    first_part + second_part
  end

  def verses(start_verse, end_verse)
    verses = "" 
    range = (start_verse..end_verse)
   for i in range do
     p i
      verses << verses.empty? ? verse(i) : "\n" + verse(i)
    end
    verses
  end

  private

  def bottles(line)
    case line
    when 1
      '1 bottle'
    when 0
      'no more bottles'
    else
      "#{line} bottles"
    end
  end

  def it_or_one (line)
    case line
    when 1
      'it'
    else 
      'one'
    end
  end
end
