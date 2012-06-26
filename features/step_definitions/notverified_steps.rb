# Full Watir API: http://wtr.rubyforge.org/rdoc/
# Full RSpec API: http://rspec.rubyforge.org/

Given /I am on the Lockss homepage/ do
  @browser.goto 'http://admin:test@localhost:8812/'
end

Then /I should see/ do |text|
  @browser.text.should =~ /#{text}/m
end

Then /^It should return a forbidden error$/ do |text|
  @browser.text.should =~ /#{text}/m
end

Then /^It should show an url$/ do |text|
  @browser.text.should =~ /#{text}/m
end

Then /^It should tell me what to do$/ do |text|
  @browser.text.should =~ /#{text}/m
end

