class EventCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_card, only: %i[ show edit update destroy ]

  # GET /event_cards
  def index
    @event_cards = EventCard.all
  end

  # GET /event_cards/1
  def show
  end

  # GET /event_cards/new
  def new
    @event_card = EventCard.new
  end

  # GET /event_cards/1/edit
  def edit
  end

  # POST /event_cards
  def create
    @event_card = EventCard.new(event_card_params)

    if @event_card.save
      redirect_to @event_card, notice: "Event card was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_cards/1
  def update
    if @event_card.update(event_card_params)
      redirect_to @event_card, notice: "Event card was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /event_cards/1
  def destroy
    @event_card.destroy!
    redirect_to event_cards_url, notice: "Event card was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_card
      @event_card = EventCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_card_params
      params.require(:event_card).permit(:event_id, :card_id, :order)
    end
end
