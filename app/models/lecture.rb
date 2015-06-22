class Lecture < ActiveRecord::Base
  belongs_to :group
  
  def group
    group = Group.find(self.group_id)
  end
  
  def pretty_hour
    hour = self.hour.strftime('%H:%M')
  end
end
