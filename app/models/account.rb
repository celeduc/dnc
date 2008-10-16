class Account < ActiveRecord::Base
  Types = {
    :none                     => "Please choose an account type", 
    :accounts_payable         => "Accounts Payable", 
    :accounts_receivable      => "Accounts Receivable", 
    :accumulated_depreciation => "Accumulated Depreciation", 
    :cash                     => "Cash",  
    :cost_of_goods            => "Cost of Goods", 
    :equity_does_not_close    => "Equity - doesn't close", 
    :equity_closes            => "Equity - gets closed", 
    :retained_earnings        => "Equity - Retained Earnings", 
    :expense                  => "Expense", 
    :fixed_assets             => "Fixed Assets", 
    :income                   => "Income",
    :inventory                => "Inventory", 
    :long_term_liabilities    => "Long-Term Liabilities", 
    :other_assets             => "Other Assets",
    :current_assets           => "Other Current Assets", 
    :current_liabilities      => "Other Current Liabilities" }

  has_and_belongs_to_many :entries
  validates_inclusion_of :type, :in => Types.values
  validates_uniqueness_of :name

  def normal_debit_balance?( xtype ) 
    debit_balance_accounts = {:ar, :cash, :cost_of_goods, :expense, :fixed_assets, :inventory, :other_assets, :current_assets}
    return !(debit_balance_accounts[xtype]).nil?
  end

  def normal_credit_balance?( xtype )
    return(xtype != :none) && !normal_debit_balance?(xtype)
  end

  protected
  def validate
    errors.add(:type, "You must select an account type.") if (type == :none )
  end

end
