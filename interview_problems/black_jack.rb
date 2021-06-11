# frozen_string_literal: true

# 52 cards total
# 13 suited cards each
# Natural blackjack 21 (A + Face card = 21) 2 cards
# Composite blackjack more than 2 cards

# Card
class Card
  attr_reader :value, :name

  def initialize(name, value)
    @name = name
    @value = value
  end

  def self.create_cards(names, values)
    cards = []
    names.each_with_index { |name, index| cards << new(name, values[index]) }
    cards
  end
end

class Diamond < Card; end

class Heart < Card; end

class Club < Card; end

class Spade < Card; end

class AbstractShuffle
  def shuffle; end
end

class TwoCardShuffle
  def shuffle; end
end

class RecursiveArray
  DEFAULT_ITERATIONS = 5

  def shuffle(deck)
    current_iteration = DEFAULT_ITERATIONS
    recursive_shuffle(current_iteration, deck)
    # take random card from deck
    # and insert into deck 2
    # continue filling deck 2 when full
    # call shuffle
  end

  def recursive_shuffle(iteration, deck)
    return deck if iteration.zero?

    recursive_shuffle(iteration - 1, deck)
  end

  def shuffle_logic(deck)
    new_deck = []

    i = deck.count(-1)
    while i.positive?

      new_deck.push(deck.delete_at(rand(i)))
      i -= 1
    end

    new_deck.push(deck.first)
  end
end
# Club.new(1)

class PokerDeck
  NUMBER_OF_CARDS = 52
  SUITS = [Diamond, Heart, Club, Spade].freeze
  TYPES = [:ace, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king].freeze
  WEIGHTS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10].freeze

  attr_reader :cards

  def initialize
    @cards = []
    generate
    # shuffle
  end

  def generate
    SUITS.each do |klass|
      @cards.concat(klass.create_cards(TYPES, WEIGHTS))
    end
  end
end
require 'pry'

deck = PokerDeck.new
p deck
p deck.cards.count
