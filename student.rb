require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
  end

  def class_name
    @classroom&.label || 'Not assigned to any class'
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_to_classroom(new_classroom)
    @classroom = new_classroom
  end
end
