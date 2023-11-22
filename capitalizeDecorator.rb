require_relative 'decorator'

class Capitalize_decorator < Decorator
  def correct_name
    super.capitalize
  end
end
