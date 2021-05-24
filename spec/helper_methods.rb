def stubbed_transactions_1_deposit
  transaction = double('transaction', date: Time.new(2021,5,5), debit: 0, credit: 500, balance: 1500)
  transactions = [transaction]
  statement.instance_variable_set(:@transactions, transactions)
end

def stubbed_transactions_1_withdrawal
  transaction = double('transaction', date: Time.new(2021,5,5), debit: 800, credit: 0, balance: 200)
  transactions = [transaction]
  statement.instance_variable_set(:@transactions, transactions)
end

def stubbed_transactions_3
  transaction1 = double('transaction', date: Time.new(2021,5,5), debit: 800, credit: 0, balance: 200)
  transaction2 = double('transaction', date: Time.new(2021,5,5), debit: 0, credit: 12_000, balance: 12_200)
  transaction3 = double('transaction', date: Time.new(2021,5,5), debit: 5000, credit: 0, balance: 7200)
  transactions = [transaction1, transaction2, transaction3]
  statement.instance_variable_set(:@transactions, transactions)
end
