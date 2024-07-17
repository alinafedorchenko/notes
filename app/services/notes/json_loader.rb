class Notes::JsonLoader < Notes::Loader
  def initialize(file_path:)
    @file_path = file_path
  end

  def load
    result = []
    result = JSON.parse(File.read(@file_path))
  rescue Errno::ENOENT
    Rails.logger.error("File not found: #{@file_path}")
  rescue JSON::ParserError => e
    Rails.logger.error("Failed to parse JSON: #{e.message}")
  rescue StandardError => e
    Rails.logger.error("An error occurred while loading notes from file: #{e.message}")

    result
  end
end
