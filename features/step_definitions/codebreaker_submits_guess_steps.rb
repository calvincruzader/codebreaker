Given(/^the secret code is "([^"]*)"$/) do |secret|
  @messenger = StringIO.new
  @game = Codebreaker::Game.new(@messenger)
  @game.start(secret)
end

When(/^I guess "([^"]*)"$/) do |guess|
  @number_in_stream_before_guess = @messenger.string.split("\n").size
  @game.guess(guess)
end

Then(/^the mark should be "([^"]*)"$/) do |mark|
  if mark == ""
    expect(@messenger.string.split("\n").size).to eq @number_in_stream_before_guess
  else
    expect(@messenger.string.split("\n")).to include(mark)
  end

end
