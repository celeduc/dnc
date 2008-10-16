class Entry < ActiveRecord::Base

  belongs_to :txn, :class_name => "Txn", :foreign_key => "txn_id"
  has_and_belongs_to_many :accounts # each entry has one account, but one account has probably many entries.
  attr_accessor :debit, :credit, :description, :account
  acts_as_list :scope => :txn
  validates_numericality_of :debit, :credit

  protected
  def validate
    errors.add(:debit, "or credit must be non-zero; both cannot be zero") if (debit == credit) && ( debit == 0 ) 
    errors.add(:debit, "or credit must be zero; both cannot be non-zero") if (debit != 0) && (credit != 0)
  end

end
