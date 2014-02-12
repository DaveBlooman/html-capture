require 'capture'

class Capture::FolderManager
  attr_reader :capture
  attr_accessor :paths

  def initialize(config)
    @capture = Capture::Capture.new(config)
  end

  def dir
    capture.directory
  end

  def clear_shots_folder
    FileUtils.rm_rf("./#{dir}")
    FileUtils.mkdir("#{dir}")
  end

  def create_folders
    capture.paths.each do |folder_label, path|
      FileUtils.mkdir("#{dir}/#{folder_label}")
    end
    puts 'Creating Folders'
  end
end
