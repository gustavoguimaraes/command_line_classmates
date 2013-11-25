require './lib/scrapper.rb'
require './lib/student.rb'
require 'launchy'

#1. make a new scrapper
student_scrapper = Scrapper.new("https://flatironschool-bk.herokuapp.com/")

#2. get the student names from the scrapper
names = student_scrapper.get_students_names

#3. get the blogs
blogs = student_scrapper.get_the_blog_url

#4. get the twitter
twitters = student_scrapper.get_the_twitter_name

#5. make a new student object for each person

students = []
28.times do |i|
	
	students << Student.new(names[i], twitters[i], blogs[i])
end

#the code below was used to test
#student.each {|student| puts student.blog}

def students_info(student)
	 puts student.name
	 puts "This is the student's blog(if any): #{student.blog}"
	 puts "This is the student's twitter(if any): #{student.twitter}"
end


puts "To see all students and their blogs type 'all'"
puts "To open a random student's twitter type 't_random'"
puts "To open a random student's blog type 'b_random'"
puts "To get the information of a specific student, type their first name"
answer = gets.chomp.downcase

if answer == 'all'
	  students.each do |student|
	    students_info(student)
	  end

elsif answer == 't_random'
  	looping = true
  	while lopping
    	random_twitter = students.sample
    	if random_twitter.twitter != 'none'
      		Launchy.open("#{random_twitter.twitter}")
      		looping = false
    	end
  	end

elsif answer == 'b_random'
  	looping = true
  	while looping
    	random_blog = students.sample
    		if random_blog.blog != 'none'
        		Launchy.open("#{random_blog.blog}")
        		looping = false
    		end
  	end
 
else
	students.each do |student|
		first_name = /^\w+\b/.match(student.name)
		  if first_name[0].downcase == answer
		    		looping = true
		    		while looping
		      			students_info(student)
		      			puts "Would you like to visit their twitter or blog?\n  Type 'twitter' for their twitter or 'blog' for their blog"
		      			input = gets.chomp.downcase	
		      				if input == 'twitter'
			       					if student.twitter != "none"
			       						Launchy.open("#{student.twitter}")
			       						looping = false
			   						else
			   							puts
			   							puts "This person does not have twitter"
			   							
			   						end
		      				elsif input == 'blog' 
			        				if student.blog != "none"
			        					Launchy.open("#{student.blog}")
			    					else
			    						puts
			    						puts"This person does not have a blog"
			    						
			    					end
			    					looping = false
		     				 else
		      						puts
		      						puts "Not a valid command!"
		      						puts " Here is the info you requested so far.Please type only \"twitter\" or \"blog\""
		     				 end
		      		end
		end
	
	end

end

