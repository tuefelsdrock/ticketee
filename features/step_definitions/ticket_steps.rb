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


