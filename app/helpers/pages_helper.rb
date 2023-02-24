module PagesHelper

	@counter = 0
	@oe = []
	@wt = []
	@arry = []

	def todayscal
		url = "http://www.sandiego.courts.ca.gov/portal/online/calendar/D_SVCAL1.HTML"
		@page = Nokogiri::HTML(URI.open(url))
	end

	def savetodayscal
		Dir.chdir(Rails.root.join("storage"))
		open("todayscal.txt", 'a+') do |i|
				i << @page
		end
	end

	def readtodayscal
		Dir.chdir(Rails.root.join("storage"))
		file = File.open("todayscal.txt")
		@file = file.read
	end

	def get_all_OE
			@page.css('tr.MYDETAILTABLE > td > a').each do |cn|
				@arry << cn.text.strip if cn.inner_html.split('-')[4] == 'OE'
			end
	end

	def iterate
		@arry.each do |i|
		cal_s_url = "http://www.sandiego.courts.ca.gov/scripts/seekcalendar.pl?z=portal&g=#{i}&j=&p=&a="
		doc = Nokogiri::HTML(URI.open(cal_s_url))
		# @counter += 1
		# puts @counter
		@arry = doc.css('pre').text
end
	end


end
