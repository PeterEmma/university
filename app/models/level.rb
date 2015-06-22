class Level < ActiveRecord::Base
  belongs_to :language
  has_many :groups, dependent: :destroy
  
  validates :name, :language_id, presence: true
  validates_uniqueness_of :name, scope: :language_id
  
  def language
    if language_id
      language = Language.find(self.language_id)
    end
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
