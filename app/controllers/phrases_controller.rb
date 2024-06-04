class PhrasesController < ApplicationController
  before_action :set_phrase, only: %i[ show edit update destroy ]

  # GET /phrases
  def index
    @phrases = Phrase.all
  end

  # GET /phrases/1
  def show
  end

  # GET /phrases/new
  def new
    @phrase = Phrase.new
  end

  # GET /phrases/1/edit
  def edit
  end

  # POST /phrases
  def create
    @phrase = Phrase.new(phrase_params)

    if @phrase.save
      redirect_to @phrase, notice: "Phrase was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /phrases/1
  def update
    if @phrase.update(phrase_params)
      redirect_to @phrase, notice: "Phrase was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /phrases/1
  def destroy
    @phrase.destroy!
    redirect_to phrases_url, notice: "Phrase was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phrase
      @phrase = Phrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def phrase_params
      params.require(:phrase).permit(:card_id, :description)
    end
end
