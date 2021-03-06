require "spec_helper"

# @note Test code is called "spec file". It is placed in "spec/" directory with name "*_spec.rb"
#       Typically, spec files are placed sub directory such as, model class tests are placed "spec/models", API tests are placed "spec/requests", etc.

describe String do
  describe "#<<" do
    # @note "describe" stands for group of test, it takes Class or String object as argument.
    #       In this case, it is a test group for String class, among them a test group of "<<" method.
    example "文字の追加" do
      # @note "example" can also be written as "it", then it can be described naturally.
      #       "it 'appends a character' do"
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end

    #example "nilの追加" do
    it "doesn't append nil", :exception do
      # @note When the tag is passed as a symbol by argument, it can execute only these exapmles by specifying the tag at calling rspec.

      #pending('under investigation')
      # @note When it need to put the example on hold temporarily, use "pending" method to describe the reason.
      #       It can also do by replacing "example" with "xexample", "it" with "xit".
      s = "ABC"
      expect {s << nil}.to raise_error(TypeError)
    end
  end
end
