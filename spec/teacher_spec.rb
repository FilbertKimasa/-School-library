# spec/teacher_spec.rb

require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher_specialization) { 'Mathematics' }
  let(:teacher_age) { 35 }
  let(:teacher_name) { 'Mr. Smith' }
  let(:parent_permission) { true }

  describe '#initialize' do
    context 'when creating a new teacher with default values' do
      it 'creates a new teacher with default values' do
        teacher = described_class.new(teacher_specialization, teacher_age)
        expect(teacher.age).to eq(teacher_age)
        expect(teacher.name).to eq('Unknown')
        expect(teacher.parent_permission).to be_truthy
      end
    end

    context 'when creating a new teacher with specified values' do
      it 'creates a new teacher with specified values' do
        teacher = described_class.new(teacher_specialization, teacher_age, name: teacher_name, parent_permission: parent_permission)
        expect(teacher.age).to eq(teacher_age)
        expect(teacher.name).to eq(teacher_name)
        expect(teacher.parent_permission).to be_truthy
      end
    end
  end

  describe '#can_use_services?' do
    it 'always returns true for a teacher' do
      teacher = described_class.new(teacher_specialization, teacher_age)
      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
