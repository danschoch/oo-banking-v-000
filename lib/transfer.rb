class Transfer
  attr_accessor :sender, :receiver, :amount, :status

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
    if !self.valid?
      self.status = "rejected"
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    end
  end

  def reverse_transfer

  end
end
