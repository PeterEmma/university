class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.boolean :enabled, default: false
      t.integer :language_id
      t.timestamps null: false
    end
  end
end
