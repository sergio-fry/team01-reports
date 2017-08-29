class WorkingDaysController < ApplicationController
  before_action :set_working_day, only: [:show, :edit, :update, :destroy]

  # GET /working_days
  # GET /working_days.json
  def index
    @working_days = WorkingDay.all
  end

  # GET /working_days/1
  # GET /working_days/1.json
  def show
  end

  # GET /working_days/new
  def new
    @working_day = WorkingDay.new
  end

  # GET /working_days/1/edit
  def edit
  end

  # POST /working_days
  # POST /working_days.json
  def create
    @working_day = WorkingDay.new(working_day_params)

    respond_to do |format|
      if @working_day.save
        format.html { redirect_to @working_day, notice: 'Working day was successfully created.' }
        format.json { render :show, status: :created, location: @working_day }
      else
        format.html { render :new }
        format.json { render json: @working_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /working_days/1
  # PATCH/PUT /working_days/1.json
  def update
    respond_to do |format|
      if @working_day.update(working_day_params)
        format.html { redirect_to @working_day, notice: 'Working day was successfully updated.' }
        format.json { render :show, status: :ok, location: @working_day }
      else
        format.html { render :edit }
        format.json { render json: @working_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_days/1
  # DELETE /working_days/1.json
  def destroy
    @working_day.destroy
    respond_to do |format|
      format.html { redirect_to working_days_url, notice: 'Working day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_day
      @working_day = WorkingDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_day_params
      params.require(:working_day).permit(:date)
    end
end
