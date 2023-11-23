require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
    classroom&.students&.push(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def change_classroom(new_classroom)
    @classroom&.students&.delete(self)
    @classroom = new_classroom
    new_classroom&.students&.push(self)
  end
end
