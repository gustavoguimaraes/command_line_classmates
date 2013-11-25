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

	## the get_students_names method can be refactored as
	# def get_the_blog_url
	# 	html.search("href").collect { |i| i.text}
	# end 

	def get_students_names
		#Nokogiri has a method called search that looks for CSS selectors.
		names = html.search("h3")
		names.collect do | i |
			i.text
		end
	end

	# The code below was refactored and the lessons I learned are:("a.blog") is the anchor html tag <a> is assigned to a CSS class called "blog"; 
			#[i] relates to the element of the array(note: the .search method in NOKOGIRI creates an array)
			#["href"] tells the search method the name of the HTML tag to retrieve the info from 
			#blogs << html.search("a.blog")[i]["href"] 
			#.times can only iterate on numbers.
			# .length give you a number

	def get_the_blog_url
		blogs = []
		all_blog_names = (html.search(".back"))
		all_blog_names.each do |i|
			if i.search(".blog").text == "Blog"
			blogs << i.search(".blog @href")
		else
			blogs << "none"
		end
		end
		blogs 
	end

	#You can refactor the method get_the_blog_url in this manner:
	# def get_the_blog_url
	# 	html.search("a.blog").collect { |anchor| anchor["href"]}
	# end

	def get_the_twitter_name
		#Comment out the created array in order to use the collect method.
		#new_array = []
		all_twitter_names = @html.search(".student")
		all_twitter_names.collect do |element|
				if element.search(".twitter")[0].nil?
					#new_array << 
					"none"
					else element.search(".twitter @href")
					#new_array <<
					 element.search(".twitter @href")
				end
		end
	#new_array
end

end
#gives us an  object -what kind?
#my_scrapper =  Scrapper.new("https://flatironschool-bk.herokuapp.com/")
#puts my_scrapper.get_students_names
#puts my_scrapper.get_the_blog_url
#puts my_scrapper.get_the_twitter_name

#puts Scrapper.new("https://flatironschool-bk.herokuapp.com/")