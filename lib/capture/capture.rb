require 'yaml'

class Capture::Capture
  attr_accessor :config

  def initialize(config_name)
    @config = YAML::load(File.open("configs/#{config_name}.yaml"))
  end

  def directory
    @config['directory'].first
  end

  def snap_file
    @config['snap_file'] ? @config['snap_file'] : File.expand_path('lib/capture/javascript/snap.js')
  end

  def widths
    @config['screen_widths']
  end

  def domain
    @config['domain']
  end

  def paths
    @config['paths']
  end

  def engine
    @config['browser']
  end

  def capture_page_image(browser, url, width, file_name)
    puts `"#{browser}" #{@config['phantomjs_options']} "#{snap_file}" "#{url}" "#{width}" "#{file_name}"`
  end
end
