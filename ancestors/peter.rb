require 'byebug'

module Document
  def print_to_screen
    puts prepare_cover
    puts format_for_screen
    puts print
  end

  def format_for_screen
    'formatted'
  end

  def print
    @f = 'mr'
    super
    'document_printing'
  end
end

module Printable
  def print
    puts super
    'printable_printing'
  end

  def prepare_cover
    'prepare_cover'
  end
end

class Book
  include Document
  include Printable
end

b = Book.new
byebug
b.print_to_screen
