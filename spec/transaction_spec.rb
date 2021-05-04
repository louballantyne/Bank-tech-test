require 'transaction'

describe Transaction do
  alias_method :transaction, :subject

  describe 'a transaction' do
    it 'has a date' do
      transaction = Transaction.new
      expect(transaction.date).to eq Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end
    it 'creates a transaction with a debit and no credit' do
      transaction2 = Transaction.new(debit: 4)
      expect(transaction2.debit).to eq 4
      expect(transaction2.credit).to eq 0
    end
  end
end
