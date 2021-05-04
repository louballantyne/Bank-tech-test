require 'bank'

describe Bank do
  alias_method :bank, :subject

  describe 'balance' do
    it 'returns an integer' do
      expect(bank.balance).to be_an Integer
    end
  end
end
