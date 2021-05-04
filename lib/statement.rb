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
      printed_statement << print_debit(transaction.debit)
      printed_statement << " #{'%.2f' % transaction.balance}"
    end
    return printed_statement
  end

  def print_credit(credit)
    if credit.positive?
      " #{'%.2f' % credit} ||"
    else
      " ||"
    end
  end

  def print_debit(debit)
    if debit.positive?
      " #{'%.2f' % debit} ||"
    else
      " ||"
    end
  end
end
