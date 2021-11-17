require 'rubygems'
require 'bundler/setup'
require './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def can_use_services?
    if is_age_of? == true || @parent_permission
      true
    else
      false
    end
  end

  def validate_name
    @corrector.correct_name(@name)
  end

  private

  def is_age_of?
    @age >= 18
  end
end
