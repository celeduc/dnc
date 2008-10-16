class Txn < ActiveRecord::Base

  has_many :entries, :dependent => :delete_all, :order => "created_at"

  # sum of credits = sum of debits
  def balanced?
    debits = 0
    credits = 0
    self.entries.each {|entry|
      debits += entry.debit
      credits += entry.credit}
    return debits == credits
  end

  # Create a new debit entry
  def debit( account_name, amount, description )
    entry = self.entries.new
#    entry.account.name = account_name
    entry.debit = amount
    entry.credit = 0
    entry.description = description
    self.entries << entry
  end

  # create a new credit entry
  def credit( account_name, amount, description )
    entry = self.entries.new
#    entry.account.name = account_name
    entry.debit = 0
    entry.credit = amount
    entry.description = description
    self.entries << entry
  end

  protected
  def validate
    errors.add(:entries, "there must be at least two entries in a transaction") if (entries.count <= 2)
    errors.add(:entries, "the sum of all debits must equal the sum of all credits") if !balanced?
  end

end
