class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :articles

  validates :name, presence: { message: 'Please enter the name of category.' }
end
