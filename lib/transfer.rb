require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount, :number_of_transfer

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @number_of_transfer = 0
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if @amount > sender.balance
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    elsif valid? && @number_of_transfer == 0
    sender.balance-=@amount
    receiver.deposit(@amount)
    @number_of_transfer+=1
    @status = "complete"
    end
  end

  def reverse_transfer
    if @number_of_transfer == 1
      sender.deposit(@amount)
      receiver.balance-=@amount
      @status = "reversed"
    end
  end

end
