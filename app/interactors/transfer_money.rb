class TransferMoney
  include Interactor

  delegate :sender, :reciver, :amount, to: :context

  def call
    sale
  rescue ActiveRecord::ValidationError,  => e
    context.fail!(message: e.message)
  end

  private

  def sale
    ActiveRecord::Base.transaction do
      charge_sender
      add_to_reciver
      create_transaction
    end
  end

  def create_transaction
    Transaction.create!(sender: sender, receiver: receiver, amount: amount)
  end

  def charge_sender
    sender.balance = sender.balance - amount
    sender.save!
  end
end



# User(balance)
# Transaction(sender, receiver, amount)

# TransferMoney.call(sender: sender, receiver: receiver, amount: amount)

# sender.balance - amount
# receiver.balance + amount
# Transaction.create(sender: sender, receiver: receiver, amount: amount)
