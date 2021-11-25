require_relative '../classroom.rb'

describe Classroom do 
  context "When testing the Classroom class" do 
    it "Should create a new classroom when we call the class new method" do 
      new_classroom = Classroom.new('Physics')
      expect(new_classroom.label).to eq "Physics"
    end
  end
  context "When calling class methods methods" do 
    it "Should add student to classroom" do 
      new_classroom = Classroom.new('Physics')
      expect(new_classroom.students).to eq []
      new_classroom.add_student(Student.new('10', 20, 'Juanito', false))
      expect(new_classroom.students).to_not be_empty
    end
  end
end