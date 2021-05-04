require 'statement'

describe Statement do
  alias_method :statement, :subject

  context 'statement returns no transactions when there have been no transactions' do
    it "returns 'date || credit || debit || balance'" do
      expect(statement.print_statement).to eq 'date || credit || debit || balance'
    end
  end
end
