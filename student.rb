require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom, name = 'Unknown', parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
