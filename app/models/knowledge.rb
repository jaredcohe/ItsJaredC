class Knowledge < ActiveRecord::Base
  has_many :originations
  has_many :providers, :through => :originations
  accepts_nested_attributes_for :providers
end
