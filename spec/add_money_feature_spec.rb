require 'bank'
require 'statement'
require 'transaction'

describe Bank do
  alias_method :bank, :subject

  context 'User wants to make a series of deposits, then view their statement' do
    it 'prints a statement containing three transactions to stdout' do
      allow(Time).to receive(:now).and_return Time.parse("2012-01-10 11:24:30 +0100")
      bank.deposit(1000)
      allow(Time).to receive(:now).and_return Time.parse("2012-01-13 11:24:30 +0100")
      bank.deposit(2000)
      allow(Time).to receive(:now).and_return Time.parse("2012-01-14 11:24:30 +0100")
      bank.withdraw(500)
      output =  "date || credit || debit || balance"
                "2012/01/14 || || 500.00 || 2500.00"
                "2012/01/13 || 2000.00 || || 3000.00"
                "2012/01/10 || 1000.00 || || 1000.00"
      expect { bank.view_statement }.to output(/#{Regexp.quote(output)}/).to_stdout
    end
  end
end
