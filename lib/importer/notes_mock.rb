class Importer::NotesMock < Importer::Base

  def initialize(loader:)
    @loader = loader
  end

  def perform
    Searchkick.callbacks(false) do
      notes = @loader.load
      Note.import(notes)
    end

    Note.reindex
  end
end
