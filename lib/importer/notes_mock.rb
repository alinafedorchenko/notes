class Importer::NotesMock < Importer::Base

  def initialize(loader:)
    @loader = loader
  end

  def perform
    Chewy.strategy(:atomic) do
      notes = @loader.load
      Note.import(notes)
    end
  end
end
