require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
    else
      false
    end
  end


  def self.hi # -> When there is `def self.some_method_name` self. means class method
    @@hi  # -> class variable
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending" && @sender.valid? == true
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  elsif
    @sender.balance < @amount
     @status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
    end
  end
end
