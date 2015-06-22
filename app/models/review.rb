class Review < ActiveRecord::Base
  belongs_to :book
  #attr_accessible :title, :content, :rating 
end
