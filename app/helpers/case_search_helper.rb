require 'open-uri'

module CaseSearchHelper

	def click_accept_terms
		@counter = 0
		@btn_arry = []
		url = "https://roa.sdcourt.ca.gov/roa/"
		@driver = Selenium::WebDriver.for :safari
		@driver.get(url)
		sleep 1

		btn_accept_terms = @driver.find_element(:xpath, "//*[@id='j_idt36']/a[1]")
		@driver.execute_script("arguments[0].click();", btn_accept_terms)
		sleep 1
		@foo = @driver.current_url 
	end
# get icon that best identifies . . 
	def get_icon
		doc = Nokogiri::HTML(@driver.page_source)
		icon_word = doc.css('span.bold-type').text
		puts icon_word.inspect
		sleep 1
		return icon_word
	end
# tools
	def get_captcha
                word_list = [
                # Screenshot name end in 0, house_words
                ['house', 'residence', 'home'],
                # Screenshot name end in 1, clock_words
                ['clock', 'timepiece', 'watch'],
                # Screenshot name end in 2, key_words
                ['padlock', 'lock', 'key'],
                # Screenshot name end in 3, flag_words
                ['banner', 'flag', 'pennant'],
                # Screenshot name end in 4, bug_words
                ['bug', 'beetle', 'insect'],
                # Screenshot name end in 5, bulb_words
                ['bulb', 'light', 'light bulb'],
                # Screenshot name end in 6, pen_words
                ['pen', 'pencil', 'ballpoint', 'ink'],
                # Screenshot name end in 7, heart_words
                ['valentine', 'heart', 'love'],
                # Screenshot name end in 8, music_words
                ['notes', 'music', 'tune'],
                # Screenshot name end in 9, world_words
                ['world', 'globe', 'earth']]
        end

# find best icon 
	def find_best_icon(get_icon)
		get_captcha.each do |i|
				if i[0] == get_icon
					return get_captcha.index(i)
				elsif i[1] == get_icon
					return get_captcha.index(i)
				elsif i[2] == get_icon
					return get_captcha.index(i)
				elsif i[3] == get_icon
					return get_captcha.index(i)
				end
		end
	end

	def get_src_png
		puts "looking for src png"
		src = Nokogiri::HTML(@driver.page_source)
		src.xpath("//input[@type='image']").each do |i|
			icon_png = i.values[2]
			position = icon_png.index('.')
			@btn_arry << btn_png = icon_png[position - 1].to_i
		end
	end

	def get_btn(w, z)
		p w.inspect
		p z.inspect
		return w.find_index(z) + 1
	end

######################################
# click the correct captcha icon
	def click_captcha_icon(x)
		puts "//input[@id='j_idt12:button#{x}']"
		click_icon = @driver.find_element(:xpath, "//input[@id='j_idt12:button#{x}']")
		@driver.execute_script("arguments[0].click();", click_icon)
		sleep 1		
		@foo = @driver.current_url		
		sleep 1
	end
############################################################
############################################################
# get to ROA cns page
	def get_cns_page
		click_accept_terms
		@num = find_best_icon(get_icon).to_i
		get_src_png
		foo = get_btn(@btn_arry,@num)
		click_captcha_icon(foo.to_s)
	end


############################################################
# goto Date Search to get new filings
	def click_date_search_btn
		# //*[@id="toolbar-form:j_idt15"]/span[2]
		# //*[@id="toolbar-form:j_idt15"]
		btn = @driver.find_element(:xpath, "//*[@id='toolbar-form:j_idt15']/span[2]")
		@driver.execute_script("arguments[0].click();", btn)
		sleep 5
	end

	def datepicker
		btn = @driver.find_element(:xpath, "//*[@id='j_idt32:datefiled_inline']/div/table/tbody/tr[4]/td[4]/a")
		@driver.execute_script("arguments[0].click();", btn)
		sleep 1
	end

	def selectcategory
		# //*[@id="j_idt32:categorylist"]
		cat = @driver.find_element(:xpath, "//*[@id='j_idt32:categorylist']")
		choose = Selenium::WebDriver::Support::Select.new(cat)
		choose.select_by(:text, "Civil")
		sleep 2
	end

	def click_cal_btn
		# //*[@id="j_idt32:searchbutton"]
		btn = @driver.find_element(:xpath, "//*[@id='j_idt32:searchbutton']")
		@driver.execute_script("arguments[0].click();", btn)
		sleep 3
	end

	def num_of_pages
		# //*[@id="j_idt34:resultstable_paginator_bottom"]/span[3]
		@page = Nokogiri::HTML(@driver.page_source)
		puts "Number of pages:"
		puts @page.css('.ui-paginator-pages').count
		puts " - - - - "
		
	end

	def create_file
		#path = Rails.root.join("storage")
		Dir.chdir(Rails.root.join("storage"))
		open("ncf_date_search_page.txt", 'w') do |i|
				i << @page
		end
		@driver.quit
		sleep 1
	end

	def launch
		get_cns_page
		click_date_search_btn
		#datepicker
		selectcategory
		click_cal_btn
		num_of_pages
		create_file
	end

	def read_ncfs
		path = "storage/ncf_date_search_page.txt"
		#file = Nokogiri::HTML(open(path))
		file = File.open(path)

		# @file = file.xpath('//*[@id="j_idt32:datefiled_input"]')
		@file = file.read
	end

end
