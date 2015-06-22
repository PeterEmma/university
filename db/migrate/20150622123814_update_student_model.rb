class UpdateStudentModel < ActiveRecord::Migration
  def change
    change_column :students, :paid, :integer, default: false
  end
end
