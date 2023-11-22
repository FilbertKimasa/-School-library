require_relative 'decorator'

class trimDecorator < decorator
    def correct_name
        super[0,10]
    end
    
end