require 'capture'
require 'capture/capture'

class Capture::SaveImages
  attr_reader :capture
  attr_accessor :paths, :labels

  def initialize(config)
    @capture = Capture::Capture.new(config)
  end

  def directory
    capture.directory
  end

  def check_paths
    if !capture.paths
      path = File.read('spider.txt')
      eval(path)
    else
      capture.paths
    end
  end

  def labels_paths
    check_paths.each do |label, path|
      if !path
        path = label
        label = path.gsub('/', '_')
      else
        path
        label
      end
    end
  end

  def engine
    capture.engine.each { |label, browser| return browser }
  end

  def base_urls(path)
    capture.base_domain + path unless capture.base_domain.nil?
  end

  def file_names(width, label, domain_label)
    "#{directory}/#{label}/#{width}_#{engine}_#{domain_label}.html"
  end

  def save_html
    labels_paths.each do |label, path|
      base_url = base_urls(path)
      
      capture.widths.each do |width|
        base_file_name = file_names(width, label, capture.domain_label)    
        capture.capture_page_image engine, base_url, width, base_file_name unless base_url.nil?
      end
    end
  end
end
