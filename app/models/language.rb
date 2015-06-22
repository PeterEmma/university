class Language < ActiveRecord::Base
  has_many :levels, dependent: :destroy
  
    
  def levels
    levels = Level.where(language_id: self.id)
  end

end
