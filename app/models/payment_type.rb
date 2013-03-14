class PaymentType < ActiveRecord::Base
  attr_accessible :payment_type
end

# == Schema Information
#
# Table name: payment_types
#
#  id           :integer          not null, primary key
#  payment_type :string(255)
#

