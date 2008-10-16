class AddTxnIdToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :txn_id, :integer
  end

  def self.down
    remove_column :entries, :txn_id
  end
end
