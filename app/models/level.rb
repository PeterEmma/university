class Level < ActiveRecord::Base
  belongs_to :language
  has_many :groups, dependent: :destroy
  
  validates :name, :language_id, presence: true
  validates :name, uniqueness: true



end
