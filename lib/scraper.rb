require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = File.read(index_url)
    page = Nokogiri::HTML(doc)
    students = []

    page.css("div.student-card").each do |student|
      hashed_st = {
        :name => student.css("a div.card-text-container h4.student-name").text
        :location => student.css("a div.card-text-container p.student-location").text
        :profile_url => student.css("a").attributes("href").value
      }
      students << hashed_st
    end

    students 
  end

  def self.scrape_profile_page(profile_url)

  end

end
