# student_spec.rb
require_relative '../student'
require_relative '../classroom'
require_relative '../person'

RSpec.describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student_age) { 15 }
  let(:student_name) { 'Alice' }
  let(:parent_permission) { true }

  describe '#initialize' do
    context 'when creating a new student with default values' do
      it 'creates a new student with default values' do
        student = described_class.new(classroom, student_age)
        expect(student.age).to eq(student_age)
        expect(student.name).to eq('Unknown')
        expect(student.parent_permission).to be_truthy
        expect(student.classroom).to eq(classroom)
      end
    end

    context 'when creating a new student with specified values' do
      it 'creates a new student with specified values' do
        student = described_class.new(classroom, student_age, name: student_name, parent_permission: parent_permission)
        expect(student.age).to eq(student_age)
        expect(student.name).to eq(student_name)
        expect(student.parent_permission).to be_truthy
        expect(student.classroom).to eq(classroom)
      end
    end
  end

  describe '#class_name' do
    context 'when the student is assigned to a class' do
      it 'returns the class name' do
        student = described_class.new(classroom, student_age)
        expect(student.class_name).to eq('Math')
      end
    end

    context 'when the student is not assigned to any class' do
      it 'returns "Not assigned to any class"' do
        student = described_class.new(nil, student_age)
        expect(student.class_name).to eq('Not assigned to any class')
      end
    end
  end

  describe '#play_hooky' do
    it 'returns a string indicating playing hooky' do
      student = described_class.new(classroom, student_age)
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds the student to the classroom' do
      student = described_class.new(classroom, student_age)
      new_classroom = Classroom.new('Science')
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end
  end
end
