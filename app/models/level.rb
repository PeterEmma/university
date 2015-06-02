class Level < ActiveRecord::Base
  belongs_to :language
  has_many :groups
end
