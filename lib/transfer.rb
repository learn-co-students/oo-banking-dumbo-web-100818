require 'pry'

class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending"
      if self.valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        if @sender.valid?
          @status = "complete"
        else
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
        # binding.pry

      end
    end


   end

 def reverse_transfer
   reversed = Transfer.new(@receiver, @sender, @amount)
    if @status == "complete"
      reversed.execute_transaction
      @status = "reversed"
    end 
 end

end
