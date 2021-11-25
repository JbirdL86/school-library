require '../person.rb'
(id, age, name = 'Unknown', parent_permission = true)
describe Person do 
  context "When testing the Person class" do 
    it "Should create a new person when we call the class new method" do 
      new_person = Person.new('1', 30, 'robert')
      expect(new_person.id).to eq "1"
      expect(new_person.age).to eq 30
      expect(new_person.name).to eq "robert"
      expect(new_person.parent_permission).to eq true
    end
  end

  context "When testing the Person class" do 
    it "Should answer with true or false if the person can use services calling can_use_services? method" do 
      new_person = Person.new('1', 30, 'robert')
      expect(new_person.can_use_services?).to eq true
      new_person1 = Person.new('2', 15, 'jules', false)
      expect(new_person1.can_use_services?).to eq false
    end
  end

  context "When testing the Person class" do 
    it "Should correct the person name capitalizing first letter and cut to 10 characters with validate_name method" do 
      new_person = Person.new('1', 30, 'robert')
      expect(new_person.validate_name).to eq 'Robert'
      new_person1 = Person.new('2', 15, 'julesofthesaintroad')
      expect(new_person1.validate_name).to eq 'Julesofthe'
    end
  end
end
