class CaseSearchController < ApplicationController

	include CaseSearchHelper


	def ncfs
		#launch
		read_ncfs
	end

end
