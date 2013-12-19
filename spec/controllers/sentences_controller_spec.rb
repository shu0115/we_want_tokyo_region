require 'spec_helper'

describe SentencesController do
  # This should return the minimal set of attributes required to create a valid
  # Sentence. As you add validations to Sentence, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "user" => "" }
  end

  describe 'GET index' do
    before do
      @sentence = Sentence.create! valid_attributes
      controller.index
    end
    describe 'assigns all sentences as @sentences' do
      subject { controller.instance_variable_get('@sentences') }
      it { should eq([@sentence]) }
    end
  end

  describe 'GET show' do
    before do
      @sentence = Sentence.create! valid_attributes
      controller.show(@sentence.to_param)
    end
    describe 'assigns the requested sentence as @sentence' do
      subject { controller.instance_variable_get('@sentence') }
      it { should eq(@sentence) }
    end
  end

  describe 'GET new' do
    before do
      controller.new
    end
    describe 'assigns a new sentence as @sentence' do
      subject { controller.instance_variable_get('@sentence') }
      it { should be_a_new(Sentence) }
    end
  end

  describe 'GET edit' do
    before do
      @sentence = Sentence.create! valid_attributes
      controller.edit(@sentence.to_param)
    end
    describe 'assigns the requested sentence as @sentence' do
      subject { controller.instance_variable_get('@sentence') }
      it { should eq(@sentence) }
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      before do
        controller.should_receive(:redirect_to) {|u| u.should eq(Sentence.last) }
      end
      describe 'creates a new Sentence' do
        it { expect {
          controller.create(valid_attributes)
        }.to change(Sentence, :count).by(1) }
      end

      describe 'assigns a newly created sentence as @sentence and redirects to the created sentence' do
        before do
          controller.create(valid_attributes)
        end
        subject { controller.instance_variable_get('@sentence') }
        it { should be_a(Sentence) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      describe "assigns a newly created but unsaved sentence as @sentence, and re-renders the 'new' template" do
        before do
          Sentence.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'new')
          controller.create({ "user" => "invalid value" })
        end
        subject { controller.instance_variable_get('@sentence') }
        it { should be_a_new(Sentence) }
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      describe 'updates the requested sentence, assigns the requested sentence as @sentence, and redirects to the sentence' do
        before do
          @sentence = Sentence.create! valid_attributes
          controller.should_receive(:redirect_to).with(@sentence, anything)
          controller.update(@sentence.to_param, valid_attributes)
        end
        subject { controller.instance_variable_get('@sentence') }
        it { should eq(@sentence) }
      end
    end

    context 'with invalid params' do
      describe "assigns the sentence as @sentence, and re-renders the 'edit' template" do
        before do
          @sentence = Sentence.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Sentence.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'edit')
          controller.update(@sentence.to_param, { "user" => "invalid value" })
        end
        subject { controller.instance_variable_get('@sentence') }
        it { should eq(@sentence) }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @sentence = Sentence.create! valid_attributes
      controller.stub(:sentences_url) { '/sentences' }
      controller.should_receive(:redirect_to).with('/sentences')
    end
    it 'destroys the requested sentence, and redirects to the sentences list' do
      expect {
        controller.destroy(@sentence.to_param)
      }.to change(Sentence, :count).by(-1)
    end
  end
end
