class Statement
  attr_accessor :transactions
  def initialize
    @transactions = []
  end

  def print_statement
    printed_statement = 'date || credit || debit || balance'
    @transactions.each do |transaction|
      printed_statement << "\n#{transaction.date} ||"
      printed_statement << print_transaction(transaction.credit)
      printed_statement << print_transaction(transaction.debit)
      printed_statement << " #{'%.2f' % transaction.balance}"
    end
    puts printed_statement
  end

  def print_transaction(amount)
    if amount.positive?
      " #{'%.2f' % amount} ||"
    else
      " ||"
    end
  end
end
