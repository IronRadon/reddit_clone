require 'spec_helper'

describe User do
  let(:inc_user) { User.new }
  let(:user1) { FactoryGirl.create(:user) }
  it "requires username" do
    expect(inc_user).to have(1).error_on(:username)
  end

  it "requires password" do
    expect(inc_user).to have_at_least(1).error_on(:password)
  end

  it "doesn't have two of the same username" do
    user2 = user1.dup
    expect(user2).not_to be_valid
  end

  it "fetches by credentials" do
    user1
    user2 = User.find_by_credentials(user1.username, user1.password)
    expect(user1).to eq(user2)
  end

  it "requires password digest" do
    expect(inc_user).to have(1).error_on(:password_digest)
  end

  it "has a session_token" do
    expect(inc_user).to have(0).error_on(:session_token)
  end

  it "passes all validations" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "does not save the password in the database" do
    user1
    expect(User.find_by_id(1).password).to eq(nil)
  end

  it { should have_many(:subs) }

  it { should have_many(:links) }
end
