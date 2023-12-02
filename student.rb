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

 def classroom=(classroom)
    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
  
end
