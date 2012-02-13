Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @project.tickets.create!(attributes)
  end
end

# table is a Cucumber::Ast::Table
Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|
    @project.tickets.create!(attributes)
  end
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |arg1, arg2|
  #page.should have_content(arg1)
  find(arg2).should have_content(arg1)
end


When /^I attach the file "([^"]*)" to "([^"]*)"$/ do |arg1, arg2|
  attach_file(arg2, arg1)
end


When /^I select "([^"]*)" from "([^"]*)"$/ do |arg1, arg2|
  select(arg2, :from => arg1)
end

