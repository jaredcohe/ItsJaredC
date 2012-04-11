class Knowledge < ActiveRecord::Base
  has_many  :originations
  has_many  :providers, :through => :originations
  has_many  :tags
  has_many  :categories, :through => :categorizations
  has_many  :categorizations, :dependent => :destroy
  has_many  :farmings
  has_many  :lesson_plantations, :through => :farmings
  #has_many  :users, :through => :user_knowledge_states
  #has_many  :user_knowledge_states
  has_many  :users, :through => :logs
  has_many  :logs

  accepts_nested_attributes_for :farmings

  #has_many  :subcategories, :through => :subcategorizations
  #has_many  :subcategorizations

  accepts_nested_attributes_for :providers, :reject_if => lambda {|p| p[:name].blank?}#, :allow_destroy => true
  accepts_nested_attributes_for :tags, :reject_if => lambda {|p| p[:tag].blank?}#, :allow_destroy => true
  accepts_nested_attributes_for :categorizations, :reject_if => lambda {|p| p[:category_id].blank?}, :allow_destroy => true
  #accepts_nested_attributes_for :subcategorizations#, :reject_if => lambda {|p| p[:tag].blank?}#, :allow_destroy => true

  @@knowledge_kinds = %w[lesson blog_post reference stream practice event group organization space]
  @@media = %w[video live written_website written_book feed interactive audio mixed] # blog skillshare twitter ...
  @@levels = %w[beginner intermediate advanced any]
  cattr_reader :knowledge_kinds, :media, :levels

  def self.search(search_term)
    if search_term
      where(["upper(keywords) LIKE upper(?) OR upper(title) LIKE upper(?) OR upper(description) LIKE upper(?)", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%"])
      #where('upper(description) LIKE upper(?)', "%#{search_term}%")
    else
      scoped
    end
  end

  def self.full_search(search_term)
    if search_term
      #arel_table.[:title].matches(upper(?), )
      #where('upper(title) LIKE upper(?)', "%#{search_term}%".or('upper(description) LIKE upper(?)', "%#{search_term}%"))
      #Knowledge.where(Knowledge.arel_table[:title].matches("%ruby%").or(Knowledge.arel_table[:description].matches("%ruby%")))
    else
      scoped
    end
  end

  def self.description_search(search_term)
    if search_term
      where('upper(description) LIKE upper(?)', "%#{search_term}%")
    else
      scoped
    end
  end

  def self.category_search(search_term)
    if search_term
      joins(:categories).where("categories.name LIKE '%#{search_term}%'")
    else
      scoped
    end
  end

end