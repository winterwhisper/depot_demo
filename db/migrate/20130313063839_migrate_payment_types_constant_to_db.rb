class MigratePaymentTypesConstantToDb < ActiveRecord::Migration
  def up
    payment_types = [ "Check", "Credit card", "Purchase order" ]
    payment_types.each do |type|
      PaymentType.new(:payment_type => type).save
    end
  end

  def down
    payment_types = [ "Check", "Credit card", "Purchase order" ]
    payment_types.each do |type|
      PaymentType.where("payment_type = ?", type).destroy
    end
  end
end
