require 'rspec'
require '../student.rb'
require '../classroom.rb'

describe Student do
  let(:classroom) { Classroom.new('Physics') }
  let(:student) { Student.new(classroom, 16, 'John Doe', false) }

  describe '#classroom=' do
    it 'adds the student to the classroom' do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end
  end

  describe '#student_id' do
    it 'returns the student ID' do
      expect(student.student_id).to be_an(Integer)
    end
  end

  describe '#student_id=' do
    it 'sets the student ID' do
      student.student_id = 123
      expect(student.student_id).to eq(123)
    end
  end

  describe '#can_use_services?' do
    context 'when the student has parent permission' do
      it 'returns true' do
        student.parent_permission = true
        expect(student.can_use_services?).to be true
      end
    end

    context 'when the student is of age' do
      it 'returns true' do
        student.age = 18
        expect(student.can_use_services?).to be true
      end
    end

    context 'when the student does not have parent permission and is not of age' do
      it 'returns false' do
        student.parent_permission = false
        student.age = 16
        expect(student.can_use_services?).to be false
      end
    end
  end
end
