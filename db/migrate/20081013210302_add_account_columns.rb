class AddAccountColumns < ActiveRecord::Migration
  def self.up
    add_column :accounts, :name, :string
    add_column :accounts, :description, :string
    add_column :accounts, :type, :string
  end

  def self.down
    remove_column :accounts, :name
    remove_column :accounts, :description
    remove_column :accounts, :type
  end
end
