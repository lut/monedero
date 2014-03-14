class Reward < ActiveRecord::Base
	attr_accessible :merchant_id, :name, :credits

	belongs_to :merchant

end
