def bank_with_deposit
  bank = Bank.new
  bank.instance_variable_set(:@balance, 1000)
  bank.instance_variable_set(:@statement, statement)
  bank.deposit(500)
end
