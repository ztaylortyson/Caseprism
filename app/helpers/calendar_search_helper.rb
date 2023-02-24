require 'open-uri'

module CalendarSearchHelper

	def scrape
		# foo.include?('Sorry, no matches were found')
		atty = "Zachary Tyson" 
		url = "http://www.sandiego.courts.ca.gov/scripts/seekcalendar.pl?z=portal&g=&j=&p=&a=#{atty}"
		page = Nokogiri::HTML(URI.open(url))
		@page = page.css('pre').inner_text  # split(/\d{2}\/\d{2}\/\d{2}/) #
	end

	# def cal_file
	# 	Dir.chdir(Rails.root.join("storage"))
	# 	open("calendar_search.txt", 'w') do |i|
	# 			i << @page
	# 	end
	# end

	# def read_file
	# 	Dir.chdir(Rails.root.join("storage"))
	# 	f = File.open("calendar_search.txt")
	# 	@hello = f.read
	# end

end



		# date = /\d{2}\/\d{2}\/\d{2}/
		# time = /\d{2}:\d{2}(AM|PM)/
		# dept = /C-\d+/