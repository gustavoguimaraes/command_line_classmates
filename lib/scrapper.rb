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

	# method get_students_names without the .gsub! (bang)
	# def get_students_names
	# 	array1 = []
	# 	array2 = []
	# 	#Nokogiri has a method called search that looks for CSS selectors.
	# 	names = html.search("h3")
	# 	names.each do | i |
	# 		temp = i.to_s
	# 		array1 << temp
	# 	end
	# 	array1.each do |elem|
	# 		temp = elem.gsub("<h3>", "   ").gsub("</h3>", "  ")
	# 			array2 << temp
	# 	end
	# 	array2
	# end

	#method get_studets_names with gsub!
	def get_students_names
		array = []
		#Nokogiri has a method called search that looks for CSS selectors.
		names = html.search("h3")
		names.each do | i |
			temp = i.to_s
			array << temp
		end
		array.each do |elem|
			elem.gsub!("<h3>", "   ").gsub!("</h3>", "  ")
		end
		array
	end

	# The code below was refactored but the lessons I learned are:("a.blog") is the anchor html tag <a> is assigned to a CSS class called "blog"; 
			#[i] relates to the element of the array(note: the .search method in NOKOGIRI creates an array)
			#["href"] tells the search method the name of the HTML tag to retrieve the info from 
			#blogs << html.search("a.blog")[i]["href"] 
			#.times can only iterate on numbers.
			# .length give you a number
	def get_the_blog_url
		blogs = []
		temp = (html.search("a.blog"))
		temp.each do |i|
			href = i["href"]
			blogs << href
			
		end
		blogs 
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
#my_scrapper =  Scrapper.new("https://flatironschool-bk.herokuapp.com/")
#puts my_scrapper.get_students_names
#puts my_scrapper.get_the_blog_url
#puts my_scrapper.get_the_twitter_name

#puts Scrapper.new("https://flatironschool-bk.herokuapp.com/")