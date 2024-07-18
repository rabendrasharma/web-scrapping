# app/services/yc_scraper.rb

require 'nokogiri'
require 'watir'

class ScraperService
  BASE_URL = 'https://www.ycombinator.com'

  def initialize(n, filters)
    @n = n
    @filters = filters
    @companies = []
  end

  def scrape
    page = 1
    while @companies.size < @n
      @url = "#{BASE_URL}/companies?page=#{page}&#{filter_params}"
      browser = Watir::Browser.new(:chrome, headless: true)
      browser.goto(@url)
      browser.element(css: '[class*="_results_"]').wait_until(&:present?)
      sleep(3) # sleep for 3 sec as the page loads dynamic async data and takes time to load all the desired data, need to wait untill all data loads on the page in order to scrap.
      @html_content = browser.html
      document = Nokogiri::HTML(@html_content)
      parse_page(document)
      page += 1
      break if document.css('.company-card').empty?
    end
    @companies.take(@n)
  end

  private

  def filter_params
    @filters.to_query
  end

  def parse_page(document)
    document.css('[class*="_company_"]').each do |card|
      break if @companies.size >= @n

      company = {
        name: card.at_css('[class*="_coName_"]')&.text,
        location: card.at_css('[class*="_coLocation_"]')&.text,
        description: card.at_css('[class*="_coDescription_"]')&.text,
        yc_batch: card.at_css('[class*="_tagLink_"]')&.text,
        url: "#{BASE_URL}#{card&.attributes["href"]&.value}"
      }

      @companies << company
    end
  end
end
