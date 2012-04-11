class Log < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :knowledge
  belongs_to  :lesson_plantation
  validates_presence_of :user_id
end
