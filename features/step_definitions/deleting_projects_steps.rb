Then /^I should not see "([^"]*)"$/ do |arg1|
  page.should_not have_content(arg1)
end

