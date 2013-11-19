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
    output = double('fake IO')
    expect(output).to receive(:puts).with("Hello, world!")
    HelloWorld.new(output).go!
  end

  it "prints 'Hello, World!' to some output stream, using a real IO object" do
    pending "Sam figuring out how IO actually works"
    io = IO.new
    HelloWorld.new(io).go!
    io.rewind
    expect(io.read).to eq("Hello, world!")
  end
end
