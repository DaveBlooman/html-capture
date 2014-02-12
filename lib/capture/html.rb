require 'capture/capture'

class Capture::SavePage
  attr_reader :capture

  def initialize(config)
    @capture = Capture::Capture.new(config)
  end

  def directory
    capture.directory
  end

  def engine
    capture.engine.each { |label, browser| return browser }
  end

  def urls(path)
    capture.base_domain + path
  end

  def file_names(width, label, domain_label)
    "#{directory}/#{label}/#{width}_#{engine}_#{domain_label}.html"
  end

  def save_html
    capture.paths.each do |label, path|
      url = urls(path)
      
      capture.widths.each do |width|
        file_name = file_names(width, label, capture.domain_label)    
        capture.capture_page_image engine, url, width, file_name
      end
    end
  end
end
