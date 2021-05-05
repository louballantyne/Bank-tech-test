require_relative 'statement'
require_relative 'transaction'

class Bank
  attr_reader :balance

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def deposit(amount)
    amount = amount.to_f
    return "Please enter a number > 0 to deposit" unless amount.positive?
    if amount.to_s.split('.').last.size > 2
      return "Please enter a number with no more than 2 decimal places to deposit"
    end

    @balance += amount
    @statement.transactions << Transaction.new(credit: amount, balance: @balance)
  end

  def withdraw(amount)
    amount = amount.to_f
    return "Please enter a number > 0 to withdraw" unless amount.positive?
    return "Insufficient funds" if amount > @balance
    if amount.to_s.split('.').last.size > 2
      return "Please enter a number with no more than 2 decimal places to withdraw"
    end

    @balance -= amount
    @statement.transactions << Transaction.new(debit: amount, balance: @balance)
  end

  def view_statement
    @statement.print_statement
  end
end
