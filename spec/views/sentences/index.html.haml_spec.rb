require 'spec_helper'

describe "sentences/index" do
  before(:each) do
    assign(:sentences, [
      stub_model(Sentence,
        :user => nil,
        :words => "MyText"
      ),
      stub_model(Sentence,
        :user => nil,
        :words => "MyText"
      )
    ])
  end

  it "renders a list of sentences" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
