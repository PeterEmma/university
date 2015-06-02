class Group < ActiveRecord::Base
  belongs_to :level
  has_many :lectures
end
