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
    pages = Product.all.count / 20 + 1
    expire_fragment("all_users-page")
    for page in 1..pages
      expire_fragment("all_users-page#{page}")
    end
    expire_fragment("user-#{user.id}")
  end
end