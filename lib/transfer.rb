# require_relative './bank_account.rb'
require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    # @transfer = transfer
    @status = 'pending'
    @receiver = receiver
    @sender = sender
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      false
    end
  end
  # binding.pry
  def execute_transaction
    if @status == 'pending' && @sender.balance > @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
      return true
    else
      @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      # binding.pry
      @status = "reversed"
    end
  end

end

#send is not amanda
# it "can execute a successful transaction between two accounts" do
#   transfer.execute_transaction
#   expect(amanda.balance).to eq(950)
#   expect(avi.balance).to eq(1050)
#   expect(transfer.status).to eq("complete")
