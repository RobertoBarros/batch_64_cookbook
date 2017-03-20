require 'nokogiri'
require 'open-uri'

class Parser

  def initialize()
    @names = []
    @urls = []
  end

  def search(ingredient)

    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"

    doc = load_html(url)

    doc.search('.m_titre_resultat a').each do |link|
      @names << link.text
      @urls << 'http://www.letscookfrench.com' + link.attributes['href'].value
    end

    @names
  end

  def import(index)
    url = @urls[index]
    doc = load_html(url)

    name = doc.search('.item .fn').text
    description = doc.search('.m_content_recette_ingredients').text.gsub(/\r\n/,'').strip.squeeze(' ')
    difficulty = doc.search('.m_content_recette_breadcrumb').text.gsub(/\r\n/,'').squeeze(' ').strip
    cook_time = doc.search('.m_content_recette_info').text.gsub(/\r\n/,'').strip.squeeze(' ')

    return Recipe.new(name, description, difficulty, cook_time)
  end

  private

  def load_html(url)
    html_file = open(url).read
    Nokogiri::HTML(html_file, nil, 'utf-8')
  end
end
