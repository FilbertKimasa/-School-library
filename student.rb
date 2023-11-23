require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = classroom
    # classroom&.students&.push(self)
    classroom&.add_student(self)
  end

  def class_name
    @classroom&.label || 'Not assigned to any class'
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_to_classroom(new_classroom)
    @classroom&.students&.delete(self)
    @classroom = new_classroom
    new_classroom&.students&.push(self)
  end
end
