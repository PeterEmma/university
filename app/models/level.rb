class Level < ActiveRecord::Base
  belongs_to :language
  has_many :groups, dependent: :destroy
  
  validates :name, :language_id, presence: true
  validates :name, uniqueness: true

  def language
    language = Language.find(self.language_id)
  end
  
  def groups
    groups = Group.where(level_id: self.id)
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
