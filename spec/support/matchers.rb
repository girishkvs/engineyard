require 'rspec/matchers'

RSpec::Matchers.define :have_command_like do |regex|
  match do |command_list|
    @found = command_list.find{|c| c =~ regex }
    !!@found
  end

  failure_message_for_should do |command_list|
    "Didn't find a command matching #{regex} in commands:\n\n" + command_list.join("\n\n")
  end

  failure_message_for_should_not do |command_list|
    "Found unwanted command:\n\n#{@found}\n\n(matches regex #{regex})"
  end
end

RSpec::Matchers.define :have_app_code do
  match { |instance| instance.has_app_code? }

  failure_message_for_should do |instance|
    "Expected #has_app_code? to be true on instance: #{instance.inspect}"
  end

  failure_message_for_should_not do |instance|
    "Expected #has_app_code? to be false on instance: #{instance.inspect}"
  end
end
