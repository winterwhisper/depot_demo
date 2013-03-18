class Console::HomeController < Console::ConsoleController
  before_filter { |c| c.authorize 'seller' }

  def index
  end
end
