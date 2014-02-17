class Payment < ActiveRecord::Base
  belongs_to :service

  def self.with(params)
    transaction do
      payment = begin
        Payment.where(line_item_id: params[:line_item_id], \
                              service_id: params[:service_id]).first_or_create
      rescue ActiveRecord::RecordNotUnique
        Payment.where(line_item_id: params[:line_item_id], \
                              service_id: params[:service_id]).first
      end
      if block_given?
        payment.lock!
        yield(payment)
        payment.save!
      end
    end
  end
end
