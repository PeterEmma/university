class Student < ActiveRecord::Base
  belongs_to :group
  
  validates :firstname, :lastname, :email, :phone, :amount, :paid, presence: true
  
  
end
