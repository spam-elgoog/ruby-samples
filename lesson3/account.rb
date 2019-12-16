# frozen_string_literal: true

# Sample exercise with Accounts, includes two extended
# classes Chequing and Saving
class Account
  include Math
  attr_reader :name, :balance
  def initialize(name, balance = 100)
    @name = name
    @balance = balance
  end

  def display_balance(pin_number)
    if pin == pin_number
      puts "Balance: $#{@balance}"
    else
      puts pin_error
    end
  end

  def withdraw(pin_number, amount)
    if pin_number == pin
      if amount < balance
        puts "Withdrew #{amount}. New balance #{balance - amount.abs}"
      end
    else
      puts pin_error
    end
  end

  private

  def pin
    @pin = 1234
  end

  def pin_error
    'Access denied: incorrect PIN.'
  end
end

class Saving < Account; end
class Chequing < Account; end

checking_account = Account.new('Peter', 1000)
checking_account.display_balance(1234)
checking_account.withdraw 1234, 50
