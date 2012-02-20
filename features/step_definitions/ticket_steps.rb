Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    state = attributes.delete("state")
    ticket = @project.tickets.create!(
      attributes.merge!(:user =>
                          User.find_by_email!(email)))
    ticket.state = State.find_or_create_by_name(state) if state
    ticket.tag!(tags) if tags
    ticket.save
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


Then /^I should not see "([^"]*)" within "([^"]*)"$/ do |arg1, arg2|
  find(arg2).should_not have_content(arg1)
end

