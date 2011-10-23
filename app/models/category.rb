class Category < ActiveRecord::Base
  # rails generate scaffold Subcategory name:string description:text category:references
  has_many :subcategories
end
