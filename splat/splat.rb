class Splat
  class << self
    def any_arg(*args)
      need_three(*args)
    end

    def self.need_three(*pops)
      p(*pops)
    end
  end

  def my_method(model:, cursor:, **my_hash)
    p model
    p cursor
    p my_hash
  end

  def find(me)
    finder_result = case me
                    when 'peter'
                      by_cancellation_id_or_tracking_number
                    else
                      if me == 'bob'
                        'bob label id'
                      elsif me == 'frank'
                        'frank by tracking number'
                      else
                        [nil]
                      end
    end
    puts 'here ' + finder_result
    # my_name = true
    raise StandardError, 'Error with label lookup' # if finder_result.nil?
  rescue StandardError => e
    puts 'rescuing and setting to false'
    my_name = false
    raise e
  ensure
    puts "My name is #{my_name}"
    raise 'oh bollocks'
    puts 'i did not execute'
    # finder_result
  end

  def by_cancellation_id_or_tracking_number
    'got by cancellation'
  end
end

# my_hash = { 2324 => { name: 'peter' }, 4567 => { name: 'bob' } }
# p my_hash.keys
# my_hash.values.each { |item| p item[:name] }

# arr1 = ["first", "second", "third"]
# arr2 = [99,89,88]
begin
  # Splat.any_arg(arr1)
  p 'starting find'
  puts Splat.new.find('peter')
rescue Exception => e
  pp e
end
# Splat.new.my_method(model: 'peter', name: 'bob', cursor: 'frank')
