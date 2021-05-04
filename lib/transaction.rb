class Transaction
  attr_reader :date, :debit, :credit, :balance, :time
  def initialize(credit: 0, debit: 0, balance: 0)
    @date = Time.now.strftime("%Y-%m-%d")
    @time = Time.now.strftime("%H:%M:%S")
    @debit = debit
    @credit = credit
    @balance = balance
  end
end
