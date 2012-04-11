class UserKnowledgeState < ActiveRecord::Base
  belongs_to :user
  belongs_to :knowledge
  validates_presence_of :knowledge_id
  validates_presence_of :user_id
end
