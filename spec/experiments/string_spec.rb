require "spec_helper"

# @note Test code is called "spec file". It is placed in "spec/" directory with name "*_spec.rb"
#       Typically, spec files are placed sub directory such as, model class tests are placed "spec/models", API tests are placed "spec/requests", etc.

describe String do
  describe "#<<" do
    example "文字の追加" do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end
  end
end
