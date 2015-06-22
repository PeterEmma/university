class Language < ActiveRecord::Base
  has_many :levels, dependent: :destroy
  
    
  def levels
    levels = Level.where(language_id: self.id)
  end
  
  def groups
    groups = []
    levels.each do |level|
      groups.push(Group.where(level_id: level.id))
    end
    
    groups
  end
  
  def lectures
  end
end
