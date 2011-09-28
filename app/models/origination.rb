class Origination < ActiveRecord::Base
  belongs_to :knowledge
  belongs_to :provider
end
