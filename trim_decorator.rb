require_relative 'decorator'

class TrimDecorator < Decorator
  def correct_name
    super[0, 10]
  end
end
