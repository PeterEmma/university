class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.integer :amount
      t.boolean :paid
      t.text :description
      t.timestamps null: false
    end
  end
end