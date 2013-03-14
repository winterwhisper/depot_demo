class PaymentType < ActiveRecord::Base
  attr_accessible :payment_type

  def self.payment_types
    PaymentType.select(:payment_type).map(&:payment_type)
  end
end

# == Schema Information
#
# Table name: payment_types
#
#  id           :integer          not null, primary key
#  payment_type :string(255)
#

