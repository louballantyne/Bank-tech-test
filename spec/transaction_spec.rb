require 'transaction'

describe Transaction do
  alias_method :transaction, :subject

  describe 'a transaction' do
    before do
      allow(Time).to receive(:now).and_return Time.parse("2021-05-06 11:24:30 +0100")
    end
    it 'has a date' do
      transaction = Transaction.new
      expect(transaction.date).to eq '2021-05-06'
    end
    it 'creates a transaction with a debit and no credit' do
      transaction = Transaction.new(debit: 4)
      expect(transaction.debit).to eq 4
      expect(transaction.credit).to eq 0
    end
    it 'creates a transaction with a credit and no debit' do
      transaction = Transaction.new(credit: 100)
      expect(transaction.debit).to eq 0
      expect(transaction.credit).to eq 100
    end
    it 'stores the correct balance' do
      transaction = Transaction.new(credit: 50, balance: 100)
      expect(transaction.balance).to eq 100
    end
  end
end
