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
    (sender.valid?) && (receiver.valid?) ? true : false
  end

  def execute_transaction
    if valid? && sender.balance >= @amount
      sender.balance -= amount
      receiver.balance += amount
      @last_transaction = @amount = 0
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your balance."
    end
  end

  def reverse_transfer
    @status == "complete"
    @sender.balance += @last_transaction
    @receiver.balance -= @last_transaction
    @sender = "reversed"     
  end
end
