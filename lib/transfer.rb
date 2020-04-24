class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status, :last_transaction

  def initialize(sender, reciever, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @last_transaction = 0
  end

  def valid?
    if sender.valid? && receiver.valid? && @last_transaction != @amount && sender.balance > @amount
      return true
    else 
      return false
    end
  end

  def execute_transaction
    if valid? 
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      @last_transaction = @amount
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    @status == "complete"
    @sender.balance += @last_transaction
    @receiver.balance -= @last_transaction
    @sender = "reversed"
     
  end
end
