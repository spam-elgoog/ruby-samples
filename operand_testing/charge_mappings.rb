# frozen_string_literal: true

require './charges'

# do it
class ChargeMappings
  include Charges

  attr_accessor :name, :age

  CHARGE_MAP = {
    370.to_s.to_sym => UNKNOWN,
    405.to_s.to_sym => FUEL_SURCHARGE,
    'OO'.to_sym => REMOTE_AREA_SURCHARGE,
    fuelsc: FUEL_SURCHARGE
  }.freeze

  # private_constant :CHARGE_MAP

  CHARGE_MAP2 = Hash.new(UNKNOWN).update(
    370.to_s.to_sym => UNKNOWN,
    405.to_s.to_sym => FUEL_SURCHARGE,
    'OO'.to_sym => REMOTE_AREA_SURCHARGE,
    fuelsc: FUEL_SURCHARGE
  ).freeze

  def self.code_description(code)
    CHARGE_MAP.fetch(code, UNKNOWN)
  end

  def initialize(name:, age:)
    @name = name
    @age = age
  end
end

started_success = false

unless started_success
  puts 'you failed'

else
  puts 'good'
end
# p ChargeMappings.code_description('405'.to_sym)
# p ChargeMappings.code_description('00'.to_sym)
# p ChargeMappings.code_description(:fuelsc)

# p ChargeMappings::CHARGE_MAP2['00'.to_sym]
# me = ChargeMappings::CHARGE_MAP.reject { |_, val| val == Charges::UNKNOWN }
# p ChargeMappings::CHARGE_MAP
# p me

# me = ChargeMappings.new(age: 20, name: 'Peter')
# p me.name.class
# p me.age.class

him = ChargeMappings.new(name: 'Frank', age: 32)
p him.name
