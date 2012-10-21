require "minitest_helper"

describe Search do
  before do
    @search = Search.new
  end

  it "must be valid" do
    @search.valid?.must_equal true
  end
end
