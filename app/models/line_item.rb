class LineItem < ActiveRecord::Base
	has_one :payment
end
