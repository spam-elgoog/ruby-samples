#!/usr/bin/env ruby
# frozen_string_literal: true

require 'benchmark'

class Random
  def self.array_of_natural_numbers(size, range: 0..1_000_000, seed: nil)
    srand(seed) if seed
    size.times.map do 
      rand(range)
    end
  end
  def self.path_literal_test
    n = 50_000
    Benchmark.bm do |benchmark|
      benchmark.report('Path using join'.ljust(20)) do
        n.times do 
          File.join(%w(billing test fixtures files endicia refunds endicia_refunds.csv))
        end
      end
      benchmark.report('Path literal'.ljust(20)) do
        n.times do
          './billing/test/fixtures/files/endicia/refunds/endica_refunds.csv'
        end
      end
    end
  end
end

Random.path_literal_test

puts Benchmark.measure {
  input = Random.array_of_natural_numbers(100)
}

def flatten_test
  n = 50_000
  Benchmark.bm do |benchmark|
    benchmark.report('flatten with !'.ljust(20)) do
      n.times { [1, 2, 3, 4].map { |e| [e, -e] }.flatten! }
    end

    benchmark.report('flatten'.ljust(20)) do
      n.times { n = [1, 2, 3, 4].map { |e| [e, -e] }.flatten }
    end
  end
end
