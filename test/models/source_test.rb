require "minitest_helper"

describe Source do
  before do
    @source = Source.new
  end

  it "must be valid" do
    @source.valid?.must_equal true
  end
end
