class UpdateStudenModel2 < ActiveRecord::Migration
  def change
    change_column :students, :paid, :boolean, default: false
    add_column :students, :amount_paid, :integer, default: 0
  end
end
