describe "exceptions" do
  it "can be tested" do
    expect {
      x = 1 / 0
    }.to raise_error(ZeroDivisionError)
  end
end
