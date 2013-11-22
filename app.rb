require './lib/scrapper.rb'
require './lib/student.rb'

#1. make a new scrapper
student_scrapper = Scrapper.new("https://flatironschool-bk.herokuapp.com/")

#2. get the student names from the scrapper
names = student_scrapper.get_students_names

#3. get the blogs
blogs = student_scrapper.get_the_blog_url

#4. get the twitter
twitters = student_scrapper.get_the_twitter_name

#5. make a new student object for each person

student = []
28.times do |i|
	
	student << Student.new(names[i], twitters[i], blogs[i])
end

student.each {|student| puts student.name}