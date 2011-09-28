class Provider < ActiveRecord::Base
  validates :name,        :presence => true,
                          :length => { :minimum => 3 }
  validates :description, :presence => true,
                          :length => { :minimum => 3 }
  validates :location,    :presence => true,
                          :length => { :minimum => 3 }

  has_many :originations
  has_many :knowledges, :through => :originations
end
