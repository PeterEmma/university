class Lecture < ActiveRecord::Base
  belongs_to :group
  
  def group
    if group_id
      group = Group.find(self.group_id)
    end
  end
  
  def pretty_hour
    hour = self.hour.strftime('%H:%M')
  end
end
