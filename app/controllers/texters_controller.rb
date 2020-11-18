class TextersController < ApplicationController
  before_action :set_texter, only: [:show, :edit, :update, :destroy]

  # GET /texters
  # GET /texters.json
  def index
    @texters = Texter.all
  end

  # GET /texters/1
  # GET /texters/1.json
  def show
  end

  # GET /texters/new
  def new
    @texter = Texter.new
  end

  # GET /texters/1/edit
  def edit
  end

  # POST /texters
  # POST /texters.json
  def create
    @texter = Texter.new(texter_params)
    
    respond_to do |format|
      if @texter.save
        message = "The message sent '#{@texter.client_name}' was just added."
        TwilioTextMessenger.new(message).call
        format.html { redirect_to @texter, notice: 'Texter was successfully created.' }
        format.json { render :show, status: :created, location: @texter }
      else
        format.html { render :new }
        format.json { render json: @texter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texters/1
  # PATCH/PUT /texters/1.json
  def update
    respond_to do |format|
      if @texter.update(texter_params)
        format.html { redirect_to @texter, notice: 'Texter was successfully updated.' }
        format.json { render :show, status: :ok, location: @texter }
      else
        format.html { render :edit }
        format.json { render json: @texter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texters/1
  # DELETE /texters/1.json
  def destroy
    @texter.destroy
    respond_to do |format|
      format.html { redirect_to texters_url, notice: 'Texter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texter
      @texter = Texter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def texter_params
      params.require(:texter).permit(:client_name, :message_description)
    end
end
