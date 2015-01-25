# -*- coding: utf-8 -*-
#
require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = "http://affiliate.amazon.co.jp/"
Capybara.default_wait_time = 5

module Crawler
  class Amazon
    include Capybara::DSL

    def login
      visit('')
      fill_in "username",
        :with => ''
      fill_in "password",
        :with => ''
      click_button "サインイン"
    end

    def potal
      select('',
        :from => '')
      select('昨日', :from => 'preSelectedPeriod')
      first('.line-item-links').click_link("レポート全体を表示")
    end
  end
end


crawler = Crawler::Amazon.new
crawler.login


