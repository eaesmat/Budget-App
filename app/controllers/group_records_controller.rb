class GroupRecordsController < ApplicationController
  before_action :set_group_record, only: %i[show edit update destroy]

  # GET /group_records or /group_records.json
  def index
    @group_records = GroupRecord.all
  end

  # GET /group_records/1 or /group_records/1.json
  def show; end

  # GET /group_records/new
  def new
    @group_record = GroupRecord.new
  end

  # GET /group_records/1/edit
  def edit; end

  # POST /group_records or /group_records.json
  def create
    @group_record = GroupRecord.new(group_record_params)

    respond_to do |format|
      if @group_record.save
        format.html { redirect_to group_record_url(@group_record), notice: 'Group record was successfully created.' }
        format.json { render :show, status: :created, location: @group_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_records/1 or /group_records/1.json
  def update
    respond_to do |format|
      if @group_record.update(group_record_params)
        format.html { redirect_to group_record_url(@group_record), notice: 'Group record was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_records/1 or /group_records/1.json
  def destroy
    @group_record.destroy

    respond_to do |format|
      format.html { redirect_to group_records_url, notice: 'Group record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group_record
    @group_record = GroupRecord.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_record_params
    params.require(:group_record).permit(:group_id, :record_id)
  end
end
