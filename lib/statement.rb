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
    end
    return printed_statement
  end

end

def print_credit(credit)
  if credit
    "#{credit} ||"
  else
    " ||"
  end
end




#{}"date || credit || debit || balance\n#{Time.now.strftime("%Y-%m-%d")} || 500 || || 1500"
