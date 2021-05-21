require 'peeps'
require 'database_helpers'

describe Peeps do
  describe '#all' do
    it 'returns all the peeps' do
      connection = PG.connect(dbname: 'chitter_test')
     
      peep = Peeps.create(message: "This is a peep!")
      peeps = Peeps.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.datetime).to eq peep.datetime
      expect(peeps.first.message).to eq 'This is a peep!'
    end
  end
end