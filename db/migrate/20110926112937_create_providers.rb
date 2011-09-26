class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :location

      t.timestamps
    end
  end
end
