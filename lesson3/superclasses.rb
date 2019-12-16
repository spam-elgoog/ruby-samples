# frozen_string_literal: true

def location_in_hierarchy1(object, method)
  cur_class = object.class
  my_classes = [cur_class]

  while (cur_class = cur_class.superclass)
    my_classes << cur_class
  end

  selected = my_classes.reverse!.select do |val|
    # TODO: what is the difference
    # between calling val.methods and val.instance_methods
    # val.methods will does not return methods that were
    # added using include statement
    val.instance_methods.include?(method)
  end
  p selected[0]
end

location_in_hierarchy1(1, :between?)
location_in_hierarchy1('a string', :to_s)
location_in_hierarchy1(lambda {}, :call)

# A Ruby symbol is a Ruby identifier
# In Ruby, we can look up identifiers (variable, function and constant names)
# while the program is running. This is typically done using symbols.
class Demo
  # The stuff we'll look up.
  DEFAULT = 'Hello'
  def initialize
    @message = DEFAULT
  end

  def say
    @message
  end

  # Use symbols to look up identifiers.
  def look_up_with_symbols
    [Demo.const_get(:DEFAULT), method(:say), instance_variable_get(:@message)]
  end
end

Demo.new.look_up_with_symbols

# below is just a sample from the net, used it to clean up
# my code above
def location_in_hierarchy2(object, method)
  klass = object.class
  ancestors = [klass]

  while !(superclass = klass.superclass).nil?
    ancestors << superclass
    klass = superclass
  end

  ancestors.reverse.find do |ancestor|
    ancestor.instance_methods.include?(method)
  end
end
