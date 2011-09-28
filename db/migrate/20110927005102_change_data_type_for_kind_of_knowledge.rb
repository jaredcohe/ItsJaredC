class ChangeDataTypeForKindOfKnowledge < ActiveRecord::Migration
  def self.up
    change_table :knowledges do |t|
      t.change :kind, :string
    end
  end

  def self.down
    change_table :knowledges do |t|
      t.change :kind, :integer
    end
  end
end
