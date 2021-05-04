require 'bank'

describe Bank do
  alias_method :bank, :subject

  describe 'balance' do
    it 'returns an integer' do
      expect(bank.balance).to be_an Integer
    end
  end

  describe "depositing money" do
    it 'increases the balance by 500 if 500 is deposited' do
      expect{ bank.deposit(500) }.to change { bank.balance }.by 500
    end
  end
end
