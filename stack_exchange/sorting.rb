# foo.sort { |a,b| a && b ? a <=> b : a ? -1 : 1 }
require 'Date'

Item = Struct.new(:name, :start_date, :end_date)
# Jan 2021	nil
# Jan 2022	nil
# Jan 2022	Dec 2022
# Jan 2021	Dec 2021
entries = [
    Item.new('A', Date.new(2021,1,1), nil),
    Item.new('B', Date.new(2022,1,1), nil),
    Item.new('C', Date.new(2022,1,1), Date.new(2022,12,1)),
    Item.new('D', Date.new(2021,1,1), Date.new(2021,12,1)),
    Item.new('E', Date.new(2021,1,3), nil),
    # Item.new('global.asax', false, 1),
    # Item.new('content', true, 0),
    # Item.new('Apeter', true, nil)
]
class Item
    def compare_using_dates(other)
        comparison_result = end_date <=> other.end_date

        # nil result means one of the records has a nil end_date, so the end_dates are not equal
        if comparison_result.nil?
            end_date.nil? ? 1 : -1
        elsif comparison_result.zero?
            # end_dates are equal, comparise start_dates instead
            start_date <=> other.start_date
        else
            comparison_result
        end.* -1
    end
end

# Using sort method
result = entries.sort do |a,b|
    # returns 1, 0 , -1 or nil, 1 value means object `a` will follow `b`, asc order
    comparison_result = a.end_date <=> b.end_date

    # nil result means one of the records has a nil end_date, so the end_dates are not equal
    if comparison_result.nil?
        a.end_date.nil? ? 1 : -1
    elsif comparison_result.zero?
        # end_dates are equal, comparise start_dates instead
        a.start_date <=> b.start_date
    else
        comparison_result
    end.* -1 # descending order
end

result.each {|a| p a}

sorted = entries.sort do |a,b|
    a.compare_using_dates b
end

sorted.each {|a| p a}


