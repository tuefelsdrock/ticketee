Given /^there is a state called "([^"]*)"$/ do |name|
  State.create!(:name => name)
end

When /^I select "([^"]*)" from "([^"]*)"$/ do |arg1, arg2|
  select(arg1, :from => arg2)
end
