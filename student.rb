require './person'
require './classroom'

class Student < Person
  attr_reader :classroom

  def initialize(id, age, name = 'Unknown', parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = []
  end

  def add_classroom(classroom)
    @classroom.push(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
