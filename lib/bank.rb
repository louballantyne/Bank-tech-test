require_relative 'statement'
require_relative 'transaction'

class Bank
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def view_statement
    @statement.print_statement
  end

  private

  def deposit(amount)
    amount = check_input_valid(amount)
    return amount unless amount.is_a? Float

    @balance += amount
    @statement.transactions << Transaction.new(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    amount = check_input_valid(amount)
    return amount unless amount.is_a? Float
    return "Insufficient funds" if amount > @balance


    @balance -= amount
    @statement.transactions << Transaction.new(debit: amount, balance: @balance)
  end

  def check_input_valid(amount)
    amount = amount.to_f
    return "Please enter a number > 0" unless amount.positive?
    if amount.to_s.split('.').last.size > 2
      return "Please enter a number with no more than 2 decimal places"
    end

    return amount
  end

end
