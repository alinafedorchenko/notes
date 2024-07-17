require 'rails_helper'

describe Note::Update do
  let(:note) { create(:note) }
  let(:note_params) do
    {
      title: 'Title 2',
      content: 'Content 2'
    }
  end

  let(:result) do
    described_class.new(
      note:,
      note_params:,
    ).call
  end

  context 'when valid params is provided' do
    it 'update a note' do
      expect(result.success?).to be true

      expect(result.note.title).to eq('Title 2')
      expect(result.note.content).to eq('Content 2')
    end
  end

  context 'when invalid params is provided' do
    let(:note_params) do
      {
        title: ''
      }
    end

    it 'fails' do
      expect(result.success?).to be false

      expect(result.errors.first).to be_present
    end
  end
end
