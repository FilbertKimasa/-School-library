require_relative 'decorator'

class CapitalizeDecortor < Decorator
    def correct_name
        super.capitalize
    end
end