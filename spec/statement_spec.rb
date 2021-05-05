# frozen_string_literal: true

require 'statement'
require 'helper_methods'

describe Statement do
  alias_method :statement, :subject

  context 'when there have been no transactions' do
    it "returns 'date || credit || debit || balance'" do
      expect { statement.print_statement }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
  context 'when there has been one transaction with a credit' do
    it 'prints a statement containing a date from a previous deposit' do
      stubbed_transactions_1_deposit
      expect { statement.print_statement }.to output(/#{Regexp.quote("date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || 500.00 || || 1500.00")}/).to_stdout
    end
    it 'prints a statement containing a credit from a previous deposit' do
      stubbed_transactions_1_deposit
      expect { statement.print_statement }.to output(/#{Regexp.quote("500")}/).to_stdout
    end
    it 'prints a statement containing the balance following a previous deposit' do
      stubbed_transactions_1_deposit
      expect { statement.print_statement }.to output(/#{Regexp.quote("1500")}/).to_stdout
    end
    it 'correctly prints a full statement' do
      stubbed_transactions_1_deposit
      expect { statement.print_statement }.to output(/#{Regexp.quote("date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || 500.00 || || 1500.00")}/).to_stdout
    end
  end

  context 'when there has been one transaction with a debit' do
    it 'prints a statement containing a debit from a previous deposit' do
      stubbed_transactions_1_withdrawal
      expect { statement.print_statement }.to output(/#{Regexp.quote("800")}/).to_stdout
    end
    it 'correctly prints a full statement' do
      stubbed_transactions_1_withdrawal
      expect { statement.print_statement }.to output(/#{Regexp.quote("date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || || 800.00 || 200.00")}/).to_stdout
    end
  end
  context 'when there have been three transactions' do
    it 'correctly prints a statement containing all transactions (stubbed)' do
      stubbed_transactions_3
      expect { statement.print_statement }.to output(/#{Regexp.quote("date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || || 800.00 || 200.00\n#{Time.now.strftime("%Y-%m-%d")} || 12000.00 || || 12200.00\n#{Time.now.strftime("%Y-%m-%d")} || || 5000.00 || 7200.00")}/).to_stdout
    end
  end
end
