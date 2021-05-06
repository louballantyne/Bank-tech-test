require 'bank'
require 'statement'
require 'transaction'

describe Bank do
  alias_method :bank, :subject

  context 'User wants to make a series of deposits, then view their statement' do
    it 'prints a statement containing three transactions to stdout' do
      bank.deposit(500)
      bank.deposit(1000)
      bank.withdraw(85)
      expect { bank.view_statement }.to output(/#{Regexp.quote("date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || || 85.00 || 1415.00\n#{Time.now.strftime("%Y-%m-%d")} || 1000.00 || || 1500.00\n#{Time.now.strftime("%Y-%m-%d")} || 500.00 || || 500.00")}/).to_stdout
    end
  end
end
