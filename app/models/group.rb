class Group < ActiveRecord::Base
  belongs_to :level
  has_many :lectures, dependent: :destroy
  
  validates :name, :capacity, :level_id, presence: true
  
  
end
