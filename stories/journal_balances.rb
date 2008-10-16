Functionality: Journal balances
  As an accountant
  I need journals to balance

  Scenario: Creates a journal
    Given a transaction has entries
    Sum of debits must equal sum of credits
