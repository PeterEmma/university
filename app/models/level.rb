class Level < ActiveRecord::Base
  belongs_to :language
  has_many :groups, dependent: :destroy
  
  validates :name, :language_id, presence: true
  validates :name, uniqueness: true

  def language
    language = Language.find(self.language_id)
  end
  def groups
    groups = Group.where(level_id: self.id)
  end
end
