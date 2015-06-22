class Group < ActiveRecord::Base
  belongs_to :level
  has_many :lectures, dependent: :destroy
  
  validates :name, :capacity, :level_id, presence: true
  
  def level
    if level_id
      level = Level.find(self.level_id)
    end
  end
  
  def lectures
    lectures = Lecture.where(group_id: self.id)
  end
  
  def students
    students = Student.where(group_id: self.id)
  end
  
  def students_who_paid
    students.where(paid: true)
  end
  
end
