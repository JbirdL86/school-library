require '../book.rb'

describe Book do 
  context "When testing the Book class" do 
    it "should create a new book when we call the class new method" do 
      new_book = Book.new('1', 'test_title', 'test_author')
      expect(new_book.id).to eq "1"
      expect(new_book.title).to eq "test_title"
      expect(new_book.author).to eq "test_author"
    end
  end
end