require 'rails_helper'

describe Importer::NotesMock do
  let(:loader) { double('Notes::JsonLoader') }

  describe '#perform' do
    it 'loads notes using the loader and imports them' do
      notes = [
        { id: 1, title: 'Note 1', content: 'Content of Note 1' },
        { id: 2, title: 'Note 2', content: 'Content of Note 2' }
      ]

      expect(loader).to receive(:load).and_return(notes)
      expect(Note).to receive(:import).with(notes)

      importer = Importer::NotesMock.new(loader: loader)
      importer.perform
    end
  end
end

