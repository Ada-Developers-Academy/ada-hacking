class HelloWorld
  def initialize(output = STDOUT)
    @output = output
  end

  def go!
    @output.puts "Hello, world!!!1!!1!!!eleventy!"
  end
end

describe HelloWorld do
  it "prints 'Hello, World!' to some output stream, using a test double" do
    # arrange
    output = double('fake IO')
    expect(output).to receive(:puts).with("Hello, world!")
    # act
    HelloWorld.new(output).go!
    # # assert
    # output.verify_expectations!  # not the actual method, just an example because I forget RSpec
  end

  it "prints 'Hello, World!' to some output stream, using a real IO object" do
    pending "Sam figuring out how IO actually works"
    io = IO.new
    HelloWorld.new(io).go!
    io.rewind
    expect(io.read).to eq("Hello, world!")
  end
end
