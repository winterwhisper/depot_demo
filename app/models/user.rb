class User < ActiveRecord::Base
  # attr_accessor :auth_token
  attr_accessible :name, :password_digest, :password, :password_confirmation, :auth_token, :email, 
                  :password_reset_token, :password_reset_sent_at
  has_secure_password
  validates :name, presence: true, uniqueness: true
  after_destroy :ensure_an_admin_remains
  before_create {|controller| controller.generate_token(:auth_token) }

  private
  
  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  password_digest        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  auth_token             :string(255)
#  email                  :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#

