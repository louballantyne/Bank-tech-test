class Bank

  def initialize
    @balance = 0
  end
  def balance
    @balance
  end

  def deposit(amount)
    amount = amount.to_f
    return "Please enter a number > 0 to deposit" unless amount > 0
    return "Please enter a number with no more than 2 decimal places to deposit" if amount.to_s.split('.').last.size > 2

    @balance += amount
  end

  def withdraw(amount)
    amount = amount.to_f
    return "Please enter a number > 0 to withdraw" unless amount > 0
    return "Insufficient funds" if amount > @balance
    return "Please enter a number with no more than 2 decimal places to withdraw" if amount.to_s.split('.').last.size > 2
    
    @balance -= amount
    Transaction.new(debit: amount, balance: @balance)
    return @balance
  end
end
