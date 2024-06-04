class LangsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lang, only: %i[ show edit update destroy ]

  # GET /langs
  def index
    @langs = Lang.all
  end

  # GET /langs/1
  def show
  end

  # GET /langs/new
  def new
    @lang = Lang.new
  end

  # GET /langs/1/edit
  def edit
  end

  # POST /langs
  def create
    @lang = Lang.new(lang_params)

    if @lang.save
      redirect_to @lang, notice: "Lang was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /langs/1
  def update
    if @lang.update(lang_params)
      redirect_to @lang, notice: "Lang was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /langs/1
  def destroy
    @lang.destroy!
    redirect_to langs_url, notice: "Lang was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lang
      @lang = Lang.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lang_params
      params.require(:lang).permit(:name, :flag_svg)
    end
end
