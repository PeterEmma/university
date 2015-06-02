class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :enabled, default: false
      t.integer :capacity
      t.integer :level_id
      t.timestamps null: false
    end
  end
end
