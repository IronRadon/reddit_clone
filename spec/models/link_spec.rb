require 'spec_helper'

describe Link do
  let(:link) { FactoryGirl.create(:link) }
  let(:bad_link) { Link.new }
  it "has a title" do
    expect(bad_link).to have(1).error_on(:title)
  end

  it "has an url" do
    expect(bad_link).to have(1).error_on(:url)
  end
end
