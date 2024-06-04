class CardTranslationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_card_translation, only: %i[ show edit update destroy ]

  # GET /card_translations
  def index
    @card_translations = CardTranslation.all
  end

  # GET /card_translations/1
  def show
  end

  # GET /card_translations/new
  def new
    @card_translation = CardTranslation.new
  end

  # GET /card_translations/1/edit
  def edit
  end

  # POST /card_translations
  def create
    @card_translation = CardTranslation.new(card_translation_params)

    if @card_translation.save
      redirect_to @card_translation, notice: "Card translation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /card_translations/1
  def update
    if @card_translation.update(card_translation_params)
      redirect_to @card_translation, notice: "Card translation was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /card_translations/1
  def destroy
    @card_translation.destroy!
    redirect_to card_translations_url, notice: "Card translation was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_translation
      @card_translation = CardTranslation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_translation_params
      params.require(:card_translation).permit(:card_id, :lang_id, :name_translated, :info_hints)
    end
end
