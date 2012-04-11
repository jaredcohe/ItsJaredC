class CreateLessonPlantations < ActiveRecord::Migration
  def change
    create_table :lesson_plantations do |t|
      t.references :user
      t.string :title
      t.text :description
      t.text :keywords
      t.boolean :clean

      t.timestamps
    end
  end
end
