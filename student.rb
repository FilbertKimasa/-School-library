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

  def set_classroom(classroom)
    @classroom&.students&.delete(self) 
    @classroom = classroom
    classroom&.students&.push(self) 
end
