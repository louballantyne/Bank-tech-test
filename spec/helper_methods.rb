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

def stubbed_bank_3_transactions
  transaction1 = double("transaction", :date => Time.now.strftime("%Y-%m-%d"), :debit => 800, :credit => 0, :balance => 200)
  transaction2 = double("transaction", :date => Time.now.strftime("%Y-%m-%d"), :debit => 0, :credit => 12000, :balance => 12200)
  transaction3 = double("transaction", :date => Time.now.strftime("%Y-%m-%d"), :debit => 5000, :credit => 0, :balance => 7200)
  bank = double('bank', :balance => 1000, :statement => statement)
  allow(bank).to receive(:withdraw).with(800).and_return(200)
  allow(bank).to receive(:deposit).with(12000).and_return(12200)
  allow(bank).to receive(:withdraw).with(5000).and_return(7200)
  transactions = [transaction1, transaction2, transaction3]
  statement.instance_variable_set(:@transactions, transactions)
end
