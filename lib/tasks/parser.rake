require 'csv'

namespace :parser do

	task :run do
		Rake::Task['db:drop'].invoke
	    Rake::Task['db:create'].invoke
	    Rake::Task['db:migrate'].invoke

	    def build_subject(code, name, number_of_credits)
	    	subject = Subject.new
	    	subject.code = code
	    	subject.name = name
	    	subject.number_of_credits = number_of_credits

	    	case number_of_credits
	    		when "2"
	    			subject.max_number_of_absences = 3
	    		when "4"
	    			subject.max_number_of_absences = 7
	    		when "6"
	    			subject.max_number_of_absences = 11
			end

	    	subject.save
	    	puts "Subject save true"
	    end

	    CSV.foreach("parser_data/CSV-Disciplinas.csv") do |row|
	    	build_subject(row[0], row[1], row[2])
	    end
	end


end