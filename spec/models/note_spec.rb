require 'rails_helper'

describe Note, type: :model do
  let(:valid_params) { { title: 'title', content: 'description' } }
  let(:invalid_params) { { title: '', content: '' } }

  context 'validations' do
    it 'is valid' do
      note = described_class.new(valid_params)
      note.save
      expect(note).to be_valid
    end

    it 'is invalid' do
      note = described_class.new(invalid_params)
      expect(note.valid?).not_to be
      expect(note.errors[:title]).to eq(["can't be blank"])
      expect(note.errors[:content]).to eq(["can't be blank"])
    end
  end
end
