class Transaction
  attr_reader :date
  def initialize
    @date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end
end
