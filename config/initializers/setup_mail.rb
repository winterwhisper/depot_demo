ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "example.com",  
  :user_name            => "winterwhisper.dev@gmail.com",  
  :password             => "accountfordev",
  :authentication       => "plain",  
  :enable_starttls_auto => true  
} 