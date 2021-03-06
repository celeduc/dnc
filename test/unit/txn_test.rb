require 'test_helper'

class TxnTest < ActiveSupport::TestCase

  # Test that debits == credits for this transaction
  def test_txn_balanced_by_default
    tx = Txn.new
    assert tx.balanced?
  end

  def test_txn_balanced_intentionally
    tx = Txn.new
    tx.debit( "cash", 10.5, "first one" )
    tx.credit( "cash", 10.5, "second one" )
    assert tx.balanced?
  end

  def test_txn_rather_unbalanced
    tx = Txn.new
    tx.debit( "cash", 10.2, "first one" )
    tx.credit( "credit", -10000, "second one" )
    tx.debit( "cash", 15, "third one" )
    assert !tx.balanced?
  end

  def test_txn_off_by_one
    tx = Txn.new
    tx.debit( "cash", 1, "first one" )
    tx.debit( "cash", 2, "2nd one" )
    tx.credit( "credit", 4, "third one" )
    assert !tx.balanced?
  end

  def test_txn_21_journal
    tx = Txn.new
    tx.debit( "cash", 10, "first one" )
    tx.credit( "cash", 20, "second one" )
    tx.debit( "cash", 20, "third one" )
    tx.credit( "cash", 10, "fourth one" )
    tx.debit( "cash", 40, "fifth one" )
    tx.credit( "cash", 10, "sixth one" )
    tx.debit( "cash", 10, "seventh one" )
    tx.credit( "cash", 40, "eighth one" )
    tx.debit( "cash", 10, "ninth one" )
    tx.credit( "cash", 10, "tenth one" )
    tx.debit( "cash", -10, "eleventh one" )
    tx.credit( "cash", -10, "twelfth one" )
    tx.debit( "cash", 10, "thirteenth one" )
    tx.credit( "cash", 10, "fourteenth one" )
    tx.debit( "cash", 10, "fifteenth one" )
    tx.credit( "cash", 10, "sixteenth one" )
    tx.debit( "cash", 10, "seventeenth one" )
    tx.credit( "cash", 10, "eighteenth one" )
    tx.debit( "cash", 11, "nineteenth one" )
    tx.credit( "cash", 21, "twentieth one" )
    tx.debit( "cash", 10, "twenty-first one" )
    assert tx.balanced?
  end

end
