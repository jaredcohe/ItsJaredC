class CreateUserKnowledgeStates < ActiveRecord::Migration
  def change
    create_table :user_knowledge_states do |t|
      t.references :user
      t.references :knowledge
      t.integer :user_knowledge_state_id
      t.integer :position

      t.timestamps
    end
    add_index :user_knowledge_states, :user_id
    add_index :user_knowledge_states, :knowledge_id
  end
end
