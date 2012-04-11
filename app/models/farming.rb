class Farming < ActiveRecord::Base
  belongs_to :knowledge
  belongs_to :lesson_plantation
  validates_presence_of :knowledge_id
  validates_presence_of :lesson_plantation_id
end
