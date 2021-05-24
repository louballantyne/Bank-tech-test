require 'statement'

describe Statement do
  alias_method :statement, :subject

  context 'when there have been no transactions' do
    it "returns 'date || credit || debit || balance'" do
      expect { statement.print_statement([]) }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
  context 'when there has been one transaction with a credit' do
    before do
      @transaction = double('transaction', date: Time.new(2021,5,5), debit: 0, credit: 500, balance: 1500)
    end

    it 'prints a statement containing a date from a previous deposit' do
      expect { statement.print_statement([@transaction]) }.to output(/#{Regexp.quote("date || credit || debit || balance\n2021/05/05 || 500.00 || || 1500.00")}/).to_stdout
    end
    it 'prints a statement containing a credit from a previous deposit' do
      expect { statement.print_statement([@transaction]) }.to output(/#{Regexp.quote("500")}/).to_stdout
    end
    it 'prints a statement containing the balance following a previous deposit' do
      expect { statement.print_statement([@transaction]) }.to output(/#{Regexp.quote("1500")}/).to_stdout
    end
    it 'correctly prints a full statement' do
      expect { statement.print_statement([@transaction]) }.to output(/#{Regexp.quote("date || credit || debit || balance\n2021/05/05 || 500.00 || || 1500.00")}/).to_stdout
    end
  end

  context 'when there has been one transaction with a debit' do
    before do
      @transaction = double('transaction', date: Time.new(2021,5,5), debit: 800, credit: 0, balance: 200)
    end
    it 'prints a statement containing a debit from a previous deposit' do
      expect { statement.print_statement([@transaction]) }.to output(/#{Regexp.quote("800")}/).to_stdout
    end
    it 'correctly prints a full statement' do
      expect { statement.print_statement([@transaction]) }.to output(/#{Regexp.quote("date || credit || debit || balance\n2021/05/05 || || 800.00 || 200.00")}/).to_stdout
    end
  end
  context 'when there have been three transactions' do
    it 'correctly prints a statement containing all transactions (stubbed), in reverse chronological order' do
      transaction1 = double('transaction', date: Time.new(2021,5,5), debit: 800, credit: 0, balance: 200)
      transaction2 = double('transaction', date: Time.new(2021,5,5), debit: 0, credit: 12_000, balance: 12_200)
      transaction3 = double('transaction', date: Time.new(2021,5,5), debit: 5000, credit: 0, balance: 7200)
      transactions = [transaction1, transaction2, transaction3]
      expect { statement.print_statement(transactions) }.to output(/#{Regexp.quote("date || credit || debit || balance\n2021/05/05 || || 5000.00 || 7200.00\n2021/05/05 || 12000.00 || || 12200.00\n2021/05/05 || || 800.00 || 200.00")}/).to_stdout
    end
  end
end
