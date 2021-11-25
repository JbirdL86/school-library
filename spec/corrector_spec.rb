require_relative '../corrector'
require_relative '../student'

describe Corrector do
  context 'When testing the Correct class' do
    it 'Should capitalize the name' do
      new_corrector = Corrector.new
      expect(new_corrector.correct_name('juanito')).to eq 'Juanito'
    end
    it 'Should limit the name string to 10 chars' do
      new_corrector = Corrector.new
      expect(new_corrector.correct_name('juanitoluis')).to eq 'Juanitolui'
    end
  end
end
