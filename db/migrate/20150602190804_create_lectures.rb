class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.text :description
      t.boolean :enabled, default: false
      t.time :hour
      t.string :weekday
      t.timestamps null: false
    end
  end
end
