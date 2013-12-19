class SentencesController < ApplicationController
  permits :user, :words

  # GET /sentences
  def index
    @sentences = Sentence.mine(current_user).all
  end

  # GET /sentences/1
  def show(id)
    @sentence = Sentence.mine(current_user).find(id)
  end

  # GET /sentences/new
  def new
    @sentence = Sentence.new
  end

  # GET /sentences/1/edit
  def edit(id)
    @sentence = Sentence.mine(current_user).find(id)
  end

  # POST /sentences
  def create(sentence)
    @sentence = Sentence.new(sentence)
    @sentence.user_id = current_user.id

    if @sentence.save
      redirect_to @sentence, notice: 'Sentence was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT /sentences/1
  def update(id, sentence)
    @sentence = Sentence.mine(current_user).find(id)

    if @sentence.update(sentence)
      redirect_to @sentence, notice: 'Sentence was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /sentences/1
  def destroy(id)
    @sentence = Sentence.mine(current_user).find(id)
    @sentence.destroy

    redirect_to sentences_url
  end
end
