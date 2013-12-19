require 'spec_helper'

describe "sentences/show" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :user => nil,
      :words => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/MyText/)
  end
end
