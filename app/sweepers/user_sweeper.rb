class UserSweeper < ActionController::Caching::Sweeper
  observe User

  def after_save(user)
    expire_cache_for(user)
  end

  def after_destroy(user)
    expire_cache_for(user)
  end

  private
  
  def expire_cache_for(user)
    expire_fragment(:users_count)
    expire_fragment(:all_users)
    expire_fragment("user-#{user.id}")
  end
end