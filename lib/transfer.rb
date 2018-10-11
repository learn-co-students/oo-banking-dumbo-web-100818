class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :num_transactions

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @num_transactions = 0
  end

  def valid?
  sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if @amount > sender.balance
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif valid? && @num_transactions == 0
      sender.balance-=@amount
      receiver.deposit(@amount)
      @num_transactions +=1
      @status = "complete"
    end
  end

  def reverse_transfer
    if @num_transactions == 1
      sender.deposit(@amount)
      receiver.balance -= @amount
      @status = "reversed"
    end
  end






end
