#open the libraries we need
require 'open-uri' #a gem that goes to a defined url and open it
require 'nokogiri'#line 10 go to the Nokogiri class get the HTML method in this already defined class. HTML method has has a parameter. in the parameter is a HTML file and translates it in to ruby so it can understand it.

class Scrapper

	attr_reader :html

	def initialize(url)
		#takes the url calls the open-uri method and places it in a variable
		download = open(url)
		@html = Nokogiri::HTML(download)
	end

	def get_students_names
		#Nokogiri has a method called search that looks for CSS selectors.
		html.search("h3").text
	end

	def get_the_blog_url
		blogs = []
		19.times do |i|
		blogs << html.search("a.blog")[i]["href"] 
		end
		blogs

		#html.search("a.blog")[4]["href"]
	end

	def get_the_twitter_name
		new_array = []
		all_twitter_names = @html.search("li a").text.split(" ")
		all_twitter_names.each do |element|
				if element[0] == "@"
					new_array << element
				end
		end
	new_array
end

end

#gives us an  object -what kind?
my_scrapper =  Scrapper.new("https://flatironschool-bk.herokuapp.com/")
#puts my_scrapper.get_students_names
puts my_scrapper.get_the_blog_url
#puts my_scrapper.get_the_twitter_name

#puts Scrapper.new("https://flatironschool-bk.herokuapp.com/")