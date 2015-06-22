class Student < ActiveRecord::Base
  belongs_to :group
  
  validates :firstname, :lastname, :email, :phone, :amount, :amount_paid, presence: true
  
  def group
    if group_id
      group = Group.find(self.group_id)
    end
  end
  
  def level
    level = Level.find(group.level_id)
  end
  
  def language
    language = Language.find(level.language_id)
  end
  
end
