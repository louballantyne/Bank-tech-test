# frozen_string_literal: true

class Transaction
  attr_reader :date, :debit, :credit, :balance
  def initialize(credit: 0, debit: 0, balance: 0)
    @date = Time.now.strftime('%Y-%m-%d')
    @debit = debit
    @credit = credit
    @balance = balance
  end
end
