class PasswordResetMailer
  @queue = :mailers_queue
  def self.perform(user_id)
    user = User.find(user_id)
    UserMailer.password_reset(user).deliver
    user.password_reset_sent_at = Time.zone.now
    user.save!
  end
end

