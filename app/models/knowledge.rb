class Knowledge < ActiveRecord::Base
  has_many  :originations
  has_many  :providers, :through => :originations
  has_many  :tags
  has_many  :categories, :through => :categorizations
  has_many  :categorizations
  #has_many  :subcategories, :through => :subcategorizations
  #has_many  :subcategorizations


  accepts_nested_attributes_for :providers, :reject_if => lambda {|p| p[:name].blank?}#, :allow_destroy => true
  accepts_nested_attributes_for :tags, :reject_if => lambda {|p| p[:tag].blank?}#, :allow_destroy => true
  accepts_nested_attributes_for :categorizations, :reject_if => lambda {|p| p[:category_id].blank?}, :allow_destroy => true
  #accepts_nested_attributes_for :subcategorizations#, :reject_if => lambda {|p| p[:tag].blank?}#, :allow_destroy => true

  @@knowledge_kinds = %w[lesson blog_post reference stream practice event group organization space]
  @@media = %w[video live written_website written_book interactive audio] # blog skillshare twitter ...
  @@levels = %w[beginner intermediate advanced any]
  cattr_reader :knowledge_kinds, :media, :levels

end