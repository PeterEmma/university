class Student < ActiveRecord::Base
  belongs_to :group
  
  validates :firstname, :lastname, :email, :phone, :amount, :amount_paid, presence: true
  
  
end
