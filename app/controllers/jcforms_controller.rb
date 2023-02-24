require 'pdf_forms'

class JcformsController < ApplicationController
  def index
      Dir.chdir(Rails.root.join("jcforms"))
      @records = Dir.glob("*.pdf")
  end


  def get_pdf
        puts "hello from zack"
        # pdftk = PdfForms.new('/usr/local/bin/pdftk')
        # Dir.chdir(Rails.root.join("jcforms"))
        # @pdf = pdftk.get_field_names("pos-electronic.pdf")

        # poo = pdftk.fill_form("pos-electronic.pdf", "ZZZack_ePOS.pdf", 
        #   { :sbn => "5",
        #     :atty_name => "_XXXXXXXXXXX_",
        #     :atty_firm => "XxXxxx "

        # })
      
        reader = PDF::Reader.new("ZZZack_ePOS.pdf")
        reader.pages.each do |i|
            @poo = i.text 
        end

      # pdftk = PdfForms.new('/usr/local/bin/pdftk')
      
      # file = Dir.chdir(Rails.root.join("jcforms"))

      # myhash = {:atty_name => "Zack"}

      # pdftk.fill_form("jcforms/pos-electronic.pdf", "ZACK__ePOS.pdf", 
      #     {
          
      #     :atty_name => "Zack Tyson",
      #     :sbn => "2111855555"
          
      #     })
  end


end
