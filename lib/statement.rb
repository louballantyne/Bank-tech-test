 # Generates a printed statement of transactions and dates
class Statement

  def print_statement(transactions)
    printed_statement = 'date || credit || debit || balance'
    transactions.reverse.each do |transaction|
      printed_statement << "\n#{transaction.date.strftime('%Y/%m/%d')} ||"
      printed_statement << print_transaction(transaction.credit)
      printed_statement << print_transaction(transaction.debit)
      printed_statement << " #{format_currency(transaction.balance)}"
    end
    puts printed_statement
  end

  def print_transaction(amount)
    if amount.positive?
      " #{format_currency(amount)} ||"
    else
      ' ||'
    end
  end

  def format_currency(value)
    '%.2f' % value
  end
end
