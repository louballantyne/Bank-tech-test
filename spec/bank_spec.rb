require 'bank'

describe Bank do
  alias_method :bank, :subject
  let(:statement) {double 'statement'}

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
    it 'user is unable to deposit a negative number' do
      expect(bank.deposit(-10)).to eq("Please enter a number > 0 to deposit")
    end
    it 'only allows the user to deposit integer or float values' do
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

  context 'Withdrawing with a balance of 1000' do
    before { bank.instance_variable_set(:@balance, 1000) }

    it 'user is able to withdraw an amount less than their balance' do
      expect { bank.withdraw(200) }.to change { bank.balance }.from(1000).to(800)
    end
    it 'user is unable to withdraw a negative number' do
      expect(bank.withdraw(-10)).to eq "Please enter a number > 0 to withdraw"
    end
    it 'only allows the user to withdraw integer or float values' do
      expect(bank.withdraw("hihihi")).to eq "Please enter a number > 0 to withdraw"
    end
    it 'does not allow the user to withdraw values with more than 2 dp' do
      expect(bank.withdraw(56.123124)).to eq "Please enter a number with no more than 2 decimal places to withdraw"
    end
  end

  describe 'Deposits and withdrawals create a new transaction' do
    before { bank.instance_variable_set(:@balance, 1000) }

    it 'Transaction receives new when a withdrawal is requested' do
      transaction = class_spy(Transaction)
      stub_const('Transaction', transaction)
      bank.withdraw(100)
      expect(transaction).to have_received(:new)
    end
    it 'Transaction receives new when a deposit is initiated' do
      transaction = class_spy(Transaction)
      stub_const('Transaction', transaction)
      bank.deposit(100)
      expect(transaction).to have_received(:new)
    end
  end

  context 'a user deposits 500 and wants to view their statement' do
    it 'calls statement to print a statement' do
      bank.instance_variable_set(:@statement, statement)
      allow(statement).to receive(:print_statement)
      expect(statement).to receive(:print_statement)
      bank.view_statement
    end
  end
end
