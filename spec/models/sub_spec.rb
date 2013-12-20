require 'spec_helper'

describe Sub do
  let(:empty_sub) { Sub.new }

  it "has a sub name" do
    expect(empty_sub).to have(1).error_on(:name)
  end

  it "has a moderator" do
    expect(empty_sub).to have(1).error_on(:mod_id)
  end

  it "doesn't have the same name as another sub" do
    sub1 = Sub.create!(:name => "waffles", :mod_id => 1,
                       :description => "very tasty")
    sub2 = Sub.new(:name => "waffles", :mod_id => 2)
    expect(sub2).to_not be_valid
  end

  it { should belong_to(:moderator) }

  it { should have_many(:links).through(:link_subs) }
end
