RSpec.describe CraigslistScrape do
  it "has a version number" do
    expect(CraigslistScrape::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(CraigslistScrape::Search.new({:city=>"philadelphia"})).not_to be nil
  end
end
