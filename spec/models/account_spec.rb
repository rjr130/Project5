require 'spec_helper'

describe Account do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @account = user.accounts.build(user_id: user.id, username: "eric_test", password: "test_pw", host: "Youtube")
  end

  subject { @account }

  it { should respond_to(:username) }
  it { should respond_to(:user_id) }
  it { should respond_to(:password) }
  it { should respond_to(:host) }

  describe "when user_id is not present" do
    before { @account.user_id = nil }
    it { should_not be_valid }
  end
end