class Payment < ActiveRecord::Base
	belongs_to :service

	def self.with(params)
		payment = Payment.where(line_item_id: params[:line_item_id], \
								service_id: params[:service_id]).first
		yield(payment) if block_given?
		payment.save
	end
end
