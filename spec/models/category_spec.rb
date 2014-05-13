require 'spec_helper'

describe Account do

  before do
    @category = Category.new(name: "Food")
end

  subject { @category }

  it { should respond_to(:name) }

  describe "when name is not present" do
    before { @category.name = nil }
    it { should_not be_valid }
  end
end