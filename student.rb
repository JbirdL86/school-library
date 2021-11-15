require './person'

class Student < Person
  def initialize(id, age, classroom, name, parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end
