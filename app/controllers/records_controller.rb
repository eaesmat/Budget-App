class RecordsController < ApplicationController
  before_action :set_record, only: %i[show edit update destroy]

  # GET /records or /records.json
  def index
    @records = Record.includes(:user).where(user: current_user).order(created_at: :desc)
  end

  # GET /records/1 or /records/1.json
  def show; end

  # GET /records/new
  def new
    @record = Record.new
    @groups = current_user.groups.where(user_id: current_user.id).order(:name)
  end

  # GET /records/1/edit
  def edit; end

  # POST /records or /records.json
  def create
    params = record_params
    @record = Record.new(user: current_user, name: params[:name], amount: params[:amount])

    respond_to do |format|
      if @record.save
        @group = Group.find(params[:group_id])
        @record.groups << @group
        format.html { redirect_to user_records_url(current_user, @record), notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1 or /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to record_url(@record), notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1 or /records/1.json
  def destroy
    @record.destroy

    respond_to do |format|
      format.html { redirect_to user_records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_record
    @record = Record.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def record_params
    params.require(:record).permit(:user_id, :name, :amount, :group_id)
  end
end
