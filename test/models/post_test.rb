require "minitest_helper"

describe Post do
  before do
    @post = Post.new
  end

  it "must be valid" do
    @post.valid?.must_equal true
  end
end
