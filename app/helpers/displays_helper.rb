require 'open-uri'

module DisplaysHelper

	def get_page
		url = "https://apps.calbar.ca.gov/attorney/Licensee/Detail/#{current_user.sbn}"
		@page = Nokogiri::HTML(URI.open(url))
	end

	def create_file
		#path = Rails.root.join("storage")

		Dir.chdir(Rails.root.join("storage"))
		open("state_bar_profile_page.txt", 'a+') do |i|
				i << @page
		end
	end

	


end
