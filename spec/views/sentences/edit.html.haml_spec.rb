require 'spec_helper'

describe "sentences/edit" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :user => nil,
      :words => "MyText"
    ))
  end

  it "renders the edit sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sentence_path(@sentence), "post" do
      assert_select "input#sentence_user[name=?]", "sentence[user]"
      assert_select "textarea#sentence_words[name=?]", "sentence[words]"
    end
  end
end
