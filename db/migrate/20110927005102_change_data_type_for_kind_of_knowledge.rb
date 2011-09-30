class ChangeDataTypeForKindOfKnowledge < ActiveRecord::Migration

#change data type for kind column in knowledge model

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
