class Book < ActiveRecord::Base

has_many :reviews
has_many :line_items
  
has_attached_file :image , :styles => { :small => "150x150>"}
validates_attachment_content_type :image, :content_type => /\Aimage/

  def self.search_from(search_by,keyword)
    
    if search_by == 'title'
      where('title like?', "%#{keyword}%")
    elsif search_by == 'author'
      where('author like?', "%#{keyword}%")
    else
      where( 'title like? OR author like?', "%#{keyword}%","%#{keyword}%")
    end
  end
  
  
  def self.category(query)
    where('category like?', "%#{query}%")
  end
  
end