module Console::UsersHelper
  def role_name(value)
    User.role_name(value)
  end
end
