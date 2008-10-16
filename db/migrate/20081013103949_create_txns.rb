class CreateTxns < ActiveRecord::Migration
  def self.up
    create_table :txns do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :txns
  end
end
