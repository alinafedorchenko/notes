class Importer::Main

  def perform
    run_importers
  end

  private

  def importer_classes
    [
      {
        name: Importer::NotesMock,
        args: { loader: Notes::JsonLoader.new(file_path: Rails.root.join('db', 'mocks', 'notes.json')) }
      }
    ]
  end

  def run_importers
    importer_classes.each do |importer_class|
      importer_class[:name].new(**importer_class[:args]).perform
    end
  end
end