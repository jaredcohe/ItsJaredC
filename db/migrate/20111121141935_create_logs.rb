class CreateLogs < ActiveRecord::Migration
  # rails g scaffold Log user_id:integer knowledge_id:integer lesson_plantation_id:integer order:integer score:integer review:text status:integer
  def up
    create_table :logs do |t|
      t.integer :user_id
      t.integer :knowledge_id
      t.integer :lesson_plantation_id
      t.integer :order
      t.integer :score
      t.text :review
      t.integer :status

      t.timestamps
    end
  end
  
  def down
    drop_table :logs
  end
end
