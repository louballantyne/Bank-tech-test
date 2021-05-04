require 'bank'

describe Bank do
  alias_method :bank, :subject

  describe 'Balance' do
    it 'returns an integer' do
      expect(bank.balance).to be_an Integer
    end
  end

  describe 'Deposit' do
    it 'increases the balance by 500 if 500 is deposited' do
      expect{ bank.deposit(500) }.to change { bank.balance }.by 500
    end
    it 'increases the balance to 1500 with two separate deposits of 500 and 1000' do
      bank.deposit(500)
      bank.deposit(1000)
      expect(bank.balance).to eq 1500
    end
    it 'allows the user to deposit a number with two decimal places' do
      expect{ bank.deposit(80.00) }.to change { bank.balance }.by 80
    end
    it 'will not allow a user to deposit a negative number' do
      expect(bank.deposit(-10)).to eq("Please enter a number > 0 to deposit")
    end
    it 'only allows the user to deposit integer values' do
      expect(bank.deposit("sdkgj")).to eq("Please enter a number > 0 to deposit")
    end
    it 'does not allow the user to deposit values with more than 2 dp' do
      expect(bank.deposit(87.235325)).to eq("Please enter a number with no more than 2 decimal places to deposit")
    end
  end

  context 'Withdrawing with a zero balance' do
    it 'user is unable to withdraw money' do
      expect(bank.withdraw(100)).to eq("Insufficient funds")
    end
  end
end
