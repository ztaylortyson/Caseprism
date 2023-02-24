class PagesController < ApplicationController

  include CalendarSearchHelper
  include PagesHelper
    
    

  def home 
  end

  def dash
    @user = current_user
    scrape
    todayscal
    readtodayscal
    #get_all_OE
    #savetodayscal
    # cal_file
    # read_file
  end

end
