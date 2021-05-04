class Statement
attr_accessor :transactions
  def initialize
    @transactions = []
  end

  def print_statement
    printed_statement = 'date || credit || debit || balance'
    @transactions.each do |transaction|
      printed_statement << "\n#{transaction.date} ||"
      printed_statement << print_credit(transaction.credit)
      printed_statement << " ||"
      printed_statement << " #{'%.2f' % transaction.balance}"
    end
    return printed_statement
  end

end

def print_credit(credit)
  if credit
    " #{'%.2f' % credit} ||"
  else
    " ||"
  end
end
