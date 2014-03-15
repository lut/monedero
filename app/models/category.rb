class Category < ActiveRecord::Base
  attr_accessible :name, :icon

  has_many :merchants
end
