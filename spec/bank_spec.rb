require 'bank'

describe Bank do
  alias_method :bank, :subject

  describe 'balance' do
    it 'returns an integer' do
      expect(bank.balance).to be_an Integer
    end
  end

  describe 'deposit' do
    it 'increases the balance by 500 if 500 is deposited' do
      expect{ bank.deposit(500) }.to change { bank.balance }.by 500
    end
    it 'will not allow a user to deposit a negative number' do
      expect(bank.deposit(-10)).to eq("Please enter a positive number to deposit")
    end
  end
end
