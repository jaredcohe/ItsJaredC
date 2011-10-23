class Tag < ActiveRecord::Base
  belongs_to :knowledge
  
  @@top_tags = %w[web_development math]
  @@bottom_tags = %w[css html html5 web_design ruby rails javascript jquery]
  cattr_reader :tags
  
end
