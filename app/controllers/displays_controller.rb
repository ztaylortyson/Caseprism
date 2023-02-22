class DisplaysController < ApplicationController

	include DisplaysHelper

	def show
		get_page
		create_file
	end

end
