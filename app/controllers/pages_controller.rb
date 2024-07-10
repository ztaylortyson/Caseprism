class PagesController < ApplicationController
  def home
  end

  def msword
    puts
    puts "ms word was called from the controller."
    goto_disc_folder
    download
    puts "completed tasks . . . "
  end

  def goto_disc_folder
      Dir.chdir(Rails.root.join("FOLDER", "PLEADINGS"))
  end

  def download
    send_file "cover_sheet.docx", :disposition => 'attachment'
  end

end
