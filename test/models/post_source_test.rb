require "minitest_helper"

describe PostSource do
  before do
    @post_source = PostSource.new
  end

  it "must be valid" do
    @post_source.valid?.must_equal true
  end
end
