class AddAccountKeyToEntry < ActiveRecord::Migration
  def self.up
    add_column :entries, :account_id, :integer
  end

  def self.down
    remove_column :entries, :account_id
  end
end
