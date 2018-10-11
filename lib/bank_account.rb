require 'pry'
class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end
#binding.pry
  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if (self.status == "open") && (self.balance > 0)
      return true
    end
    false
  end

  def close_account
    @status = "closed"
  end

end
