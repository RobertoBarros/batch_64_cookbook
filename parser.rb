require 'nokogiri'
require 'open-uri'

class Parser

  private

  def load_html(url)
    html_file = open(url).read
    Nokogiri::HTML(html_file, nil, 'utf-8')
  end
end
