class CreateOriginations < ActiveRecord::Migration
  def change
    create_table :originations do |t|
      t.integer :knowledge_id
      t.integer :provider_id

      t.timestamps
    end
  end
end
