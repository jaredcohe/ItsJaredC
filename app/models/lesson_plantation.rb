class LessonPlantation < ActiveRecord::Base
  belongs_to  :user
  has_many    :farmings
  has_many    :knowledges, :through => :farmings
  has_many    :users, :through => :logs
  has_many    :logs
  accepts_nested_attributes_for :knowledges, :reject_if => lambda { |a| a[:knowledge_url].blank? }

  #accepts_nested_attributes_for :farmings
  #attr_accessor :knowledge_url

  def self.search(search_term)
    if search_term
      where(["upper(keywords) LIKE upper(?) OR upper(title) LIKE upper(?) OR upper(description) LIKE upper(?)", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%"])
      #where('upper(title) LIKE upper(?)', "%#{search_term}%")
    else
      scoped
    end
  end

end
