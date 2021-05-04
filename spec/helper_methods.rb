def bank_with_deposit
  bank = Bank.new
  bank.instance_variable_set(:@balance, 1000)
  bank.instance_variable_set(:@statement, statement)
  bank.deposit(500)
end

def bank_with_withdrawal
  bank = Bank.new
  bank.instance_variable_set(:@balance, 1000)
  bank.instance_variable_set(:@statement, statement)
  bank.withdraw(800)
end

def bank_with_3_transactions
  bank = Bank.new
  bank.instance_variable_set(:@balance, 1000)
  bank.instance_variable_set(:@statement, statement)
  bank.withdraw(800)
  bank.deposit(12000)
  bank.withdraw(5000)
end
