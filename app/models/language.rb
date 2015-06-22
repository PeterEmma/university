class Language < ActiveRecord::Base
  has_many :levels, dependent: :destroy
  validates :name, presence: true
    
  def levels
    levels = Level.where(language_id: self.id)
  end
  
  def groups
    groups = Group.where(level_id: levels)
  end
  
  def students
    students = Student.where(group_id: groups)
  end
  
  def students_who_paid
    students.where(paid: true)
  end
  
  def amount_to_pay
    students.sum(:amount)
  end
  
  def amount_paid
    students.sum(:amount_paid)
  end

end
