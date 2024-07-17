module ResqueJobs
  class ImportNotesJob

    def self.queue
      :low_priority
    end

    def self.perform
      Importer::Main.new.perform
    end
  end
end

