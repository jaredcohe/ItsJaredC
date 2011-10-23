class Categorization < ActiveRecord::Base
  belongs_to :knowledge
  belongs_to :category
end
