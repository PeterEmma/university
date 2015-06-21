class Group < ActiveRecord::Base
  belongs_to :level
  has_many :lectures
  
  validates :name, :capacity, :level_id, presence: true
  
  
end
