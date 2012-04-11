class CreateFarmings < ActiveRecord::Migration
  def change
    create_table :farmings do |t|
      t.references :lesson_plantation
      t.references :knowledge
      t.string :title
      t.text :notes

      t.timestamps
    end
  end
end
