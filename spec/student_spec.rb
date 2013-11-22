require '../lib/student.rb'

 new_student = Student.new("name","twitter","blog")

describe "Student #initialize" do
	
	it "should return the name of a new student" do 
		expect(new_student.name).to eq("name")

	end
	
	it "should return the name of a new student" do 
		expect(new_student.twitter).to eq("twitter")

	end

end