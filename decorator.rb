require_relative 'nemeable'

class Decorator < Nemeable
    def initialize(nemeable)
        @nemeable = nemeable
    end

    def correct_name
        @nemeable.correct_name
    end

end