require "minitest_helper"

describe Link do
  before do
    @link = Link.new
  end

  it "must be valid" do
    @link.valid?.must_equal true
  end
end
