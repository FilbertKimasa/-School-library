require_relative 'decorator'

class trimDecorator < Decorator
    def correct_name
        super[0,10]
    end
    
end