require_relative '../student'

describe Student do
  context 'When testing the Student class' do
    it 'Should create a new student when we call the class new method' do
      new_student = Student.new('10', 20, 'Juanito', false)
      expect(new_student.id).to eq '10'
      expect(new_student.age).to eq 20
      expect(new_student.name).to eq 'Juanito'
      expect(new_student.parent_permission).to eq false
    end
  end
  context 'When calling student methods' do
    it 'Should add classroom to student' do
      new_student = Student.new('10', 20, 'Juanito', false)
      expect(new_student.classroom).to eq []
      new_student.add_classroom(Classroom.new('Physics'))
      expect(new_student.classroom).to_not be_empty
    end
    it 'Should print hooky' do
      new_student = Student.new('10', 20, 'Juanito', false)
      expect { new_student.play_hooky }.to output("¯\(ツ)/¯\n").to_stdout
    end
  end
end
