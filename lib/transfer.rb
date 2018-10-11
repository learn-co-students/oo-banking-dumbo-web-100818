

class Transfer

  attr_reader :sender, :receiver, :amount, :status

 def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
 end

 def valid?
 #check if sender is valid
 #check if receiver is valid
  (@sender.valid?) && (@receiver.valid?)
 end

 def execute_transaction
   #need to check if status is complete and we would execute this function only when the status is not complete
   #@amount was greater than the balance of the sender

   if (@status == "pending") && (@sender.balance > @amount)
  #@amount of money needs to be transfered from @sender to @receiver
     @receiver.deposit(@amount)
     #@sender needs to lose @amount
     @sender.deposit(-@amount)

     @status = "complete"

   else
     @status = "rejected"
     "Transaction rejected. Please check your account balance."

   end
  end

  def reverse_transfer
    #@amount of money needs to be transfered from @receiver to @sender
    if @status == "complete"
       @sender.deposit(@amount)
       #@receiver needs to lose @amount
       @receiver.deposit(-@amount)

       @status = "reversed"
     end
     end

end
