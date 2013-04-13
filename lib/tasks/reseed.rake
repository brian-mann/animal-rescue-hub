namespace :db do
	task :reseed => :environment do
	  desc "Recreate everything from scratch, including test data"
	  %w(drop create migrate seed).each do |task|
	    puts "Performing task #{task}"
	    #Some logic could go here
	    Rake::Task["db:#{task}"].invoke 
	  end
	end
end