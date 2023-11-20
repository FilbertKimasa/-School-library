require_relative 'person'

class Student < Person
  def initialize(id, classroom, age, parent_permission: true, name: 'Unknown')
    super(id, age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
