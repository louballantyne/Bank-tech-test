class Transaction
  attr_reader :date, :debit, :credit
  def initialize(credit: 0, debit: 0)
    @date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    @debit = debit
    @credit = credit
  end
end
