class Bank
  def initialize
    @balance = 0
  end
  def balance
    @balance
  end

  def deposit(amount)
    return "Please enter a positive number to deposit" if amount < 0
    
    @balance += amount
  end
end
