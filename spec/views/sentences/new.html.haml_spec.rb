require 'spec_helper'

describe "sentences/new" do
  before(:each) do
    assign(:sentence, stub_model(Sentence,
      :user => nil,
      :words => "MyText"
    ).as_new_record)
  end

  it "renders new sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sentences_path, "post" do
      assert_select "input#sentence_user[name=?]", "sentence[user]"
      assert_select "textarea#sentence_words[name=?]", "sentence[words]"
    end
  end
end
