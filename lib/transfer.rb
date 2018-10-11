require 'pry'


class Transfer
  # your code here

  attr_reader :sender, :amount
  attr_accessor :status, :receiver, :bank_account
  def initialize (sender, receiver, status ="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
      if @sender.valid? && @receiver.valid?
        true
      else
        false
      end
  end

  def execute_transaction

    #if @status != "complete"
if @sender.valid? && @receiver.valid? && @status != "complete"
  if amount < self.sender.balance
      self.receiver.balance += self.amount
      self.sender.balance -= self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
def reverse_transfer
  if self.status == "complete"
    self.receiver.balance -= self.amount
    self.sender.balance += self.amount
    @status = "reversed"
  end
end

end
