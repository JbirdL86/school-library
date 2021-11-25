require_relative '../teacher'

describe Teacher do
  context 'When testing the Teacher class' do
    it 'Should create a new teacher when we call the class new method' do
      new_teacher = Teacher.new('2', 40, 'Physics', 'Juanito Luis')
      expect(new_teacher.id).to eq '2'
      expect(new_teacher.age).to eq 40
      expect(new_teacher.name).to eq 'Juanito Luis'
      expect(new_teacher.parent_permission).to eq true
    end
  end
  context 'When calling teacher methods' do
    it 'Should return true to can_use_services check' do
      new_teacher = Teacher.new('2', 40, 'Physics', 'Juanito Luis', false)
      expect(new_teacher.can_use_services?).to eq true
    end
  end
end
