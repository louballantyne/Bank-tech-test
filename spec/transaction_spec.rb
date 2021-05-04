require 'transaction'

describe Transaction do
  describe 'a transaction' do
    it 'has a date' do
      transaction = Transaction.new
      expect(transaction.date).to eq Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end
  end
end
