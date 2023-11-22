require_relative 'decorator'

class Trim_decorator < Decorator
  def correct_name
    super[0, 10]
  end
end
