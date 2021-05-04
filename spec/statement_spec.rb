require 'statement'
require 'helper_methods'

describe Statement do
  alias_method :statement, :subject
  bank = Bank.new


  context 'statement returns no transactions when there have been no transactions' do
    it "returns 'date || credit || debit || balance'" do
      expect(statement.print_statement).to eq 'date || credit || debit || balance'
    end
    it 'stores transactions in an array' do
      bank_with_deposit
      expect(statement.transactions.first).to be_an Transaction
    end
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
  end
end



#       expect(statement.print_statement).to include "date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || 500 || || 1500"
