class PagesController < ApplicationController

  include CalendarSearchHelper

    
    

  def home 
  end

  def dash
    @user = current_user
    # scrape
    # cal_file
    read_file
  end

end
