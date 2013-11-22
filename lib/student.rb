class Student
	
	attr_accessor :name, :twitter, :blog

	def initialize(name,twitter, blog)
		@name = name
		@twitter = twitter
		@blog = blog
	end

end


#puts Student.new("Gus","ba", "be")