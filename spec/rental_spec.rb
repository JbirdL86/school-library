require_relative '../rental'
require_relative '../book'
require_relative '../student'
require_relative '../teacher'

describe Rental do
  context 'When testing the Rental class' do
    it 'Should create a new rental when we call the class new method' do
      new_student = Student.new('10', 20, 'Juanito', false)
      new_book = Book.new('01', 'My life', 'Me')
      new_rental = Rental.new('2020/02/02', new_book, new_student)
      expect(new_rental.date).to eq '2020/02/02'
      expect(new_rental.book.title).to eq 'My life'
      expect(new_rental.person.id).to eq '10'
    end
  end
end
