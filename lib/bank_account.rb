require 'pry'
class BankAccount
 #the bank account is going to be 1 and the transfer class is going to be menu
attr_reader :name
attr_accessor :balance, :status

 def initialize(name)
   @name = name
   @balance = 1000
   @status = "open"
end

def deposit(deposit_amg)
  self.balance += deposit_amg
end

def display_balance
  return "Your balance is $#{self.balance}."
end

def valid?
  if self.status == "open" && self.balance > 0
    true
  else
    false
  end
end

def close_account
  self.status = "closed"
end

end


bob = BankAccount.new("Bob")


#binding.pry
