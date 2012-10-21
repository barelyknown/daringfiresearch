require "minitest_helper"

describe SearchLink do
  before do
    @search_link = SearchLink.new
  end

  it "must be valid" do
    @search_link.valid?.must_equal true
  end
end
