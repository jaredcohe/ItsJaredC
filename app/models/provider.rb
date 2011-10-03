class Provider < ActiveRecord::Base
  has_many :originations
  has_many :knowledges, :through => :originations
end
