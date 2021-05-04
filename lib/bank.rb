class Bank
  def initialize
    @balance = 0
  end
  def balance
    @balance
  end

  def deposit(amount)
    amount = amount.to_f
    return "Please enter a number > 0 to deposit" unless amount.is_a? Float
    return "Please enter a number > 0 to deposit" unless amount > 0

    @balance += amount
  end
end
