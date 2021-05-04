require 'statement'
require 'helper_methods'

describe Statement do
  alias_method :statement, :subject
  bank = Bank.new


  context 'statement returns no transactions when there have been no transactions' do
    it "returns 'date || credit || debit || balance'" do
      expect(statement.print_statement).to eq 'date || credit || debit || balance'
    end
  end
  describe 'statement' do
    it 'stores transactions in an array' do
      bank_with_deposit
      expect(statement.transactions.first).to be_an Transaction
    end
  end
  context 'statement prints a statement containing one transaction with a credit' do
    it 'prints a statement containing a date from a previous deposit' do
      bank_with_deposit
      expect(statement.print_statement).to include "#{Time.now.strftime("%Y-%m-%d")}"
    end
    it 'prints a statement containing a credit from a previous deposit' do
      bank_with_deposit
      expect(statement.print_statement).to include "500"
    end
    it 'prints a statement containing the balance following a previous deposit' do
      bank_with_deposit
      expect(statement.print_statement).to include "1500"
    end
    it 'correctly prints a full statement' do
      bank_with_deposit
      expect(statement.print_statement).to eq "date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || 500.00 || || 1500.00"
    end
  end
  context 'statement prints a statement containing one transaction with a debit' do
    it 'prints a statement containing a debit from a previous deposit' do
      bank_with_withdrawal
      expect(statement.print_statement).to include "800"
    end
    it 'correctly prints a full statement' do
      bank_with_withdrawal
      expect(statement.print_statement).to eq "date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || || 800.00 || 200.00"
    end
  end
end
