# frozen_string_literal: true

require 'bigdecimal'
require 'bigdecimal/util'

class Dimension
  def some_dimension
    # "3X4X2".split("X")
    '3X4X2'.split('X').map(&:to_d).sort
  end

  def process
    raise ArgumentError, 'Caller must pass a block' unless block_given?

    yield('blast')
  end
end
DATE_FORMAT = '%Y%m%d' # CCYYMMDD

TYPE_CONVERSIONS = {
  date: ->(value) { Date.strptime(value, DATE_FORMAT) },
  decimal: ->(value) { BigDecimal(value) },
  string: ->(value) { value.to_s.blank? ? nil : value.to_s.strip }
}.freeze

shirt = nil

p shirt.to_s
me = Dimension.new
me.process do
  p 'hellow'
end
p me.some_dimension
