class AddEntryColumns < ActiveRecord::Migration
  def self.up
    add_column :entries, :description, :string
    add_column :entries, :debit, :decimal, :precision => 17, :scale => 2, :default => 0
    add_column :entries, :credit, :decimal, :precision => 17, :scale => 2, :default => 0
  end

  def self.down
    remove_column :entries, :description
    remove_column :entries, :debit
    remove_column :entries, :credit
  end
end
