require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(classroom, 16, 'Alice', false) }

  describe '#label' do
    it 'returns the label' do
      expect(classroom.label).to eq('Math')
    end
  end

  describe '#students' do
    it 'returns an empty array initially' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds the student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
