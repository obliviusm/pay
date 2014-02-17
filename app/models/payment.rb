class Payment < ActiveRecord::Base
  belongs_to :service

  def self.with(params)
    transaction do
      payment = Payment.where(line_item_id: params[:line_item_id], \
                              service_id: params[:service_id]).first_or_create
      if block_given?
        yield(payment)
        payment.save
      end
    end
  end
end
