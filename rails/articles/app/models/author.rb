class Author < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  has_many :articles

  def to_s
  	[first_name, last_name].compact.join(' ')
  end
end
