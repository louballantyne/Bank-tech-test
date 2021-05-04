class Statement
attr_accessor :transactions
  def initialize
    @transactions = []
  end

  def print_statement
    'date || credit || debit || balance'
  end

end
