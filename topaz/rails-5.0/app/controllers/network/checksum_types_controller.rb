class Network::ChecksumTypesController < ApplicationController
  before_action :set_network_checksum_type, only: [:show, :edit, :update, :destroy]

  # GET /network/checksum_types
  # GET /network/checksum_types.json
  def index
    @network_checksum_types = Network::ChecksumType.all
  end

  # GET /network/checksum_types/1
  # GET /network/checksum_types/1.json
  def show
  end

  # GET /network/checksum_types/new
  def new
    @network_checksum_type = Network::ChecksumType.new
  end

  # GET /network/checksum_types/1/edit
  def edit
  end

  # POST /network/checksum_types
  # POST /network/checksum_types.json
  def create
    @network_checksum_type = Network::ChecksumType.new(network_checksum_type_params)

    respond_to do |format|
      if @network_checksum_type.save
        format.html { redirect_to @network_checksum_type, notice: 'Checksum type was successfully created.' }
        format.json { render :show, status: :created, location: @network_checksum_type }
      else
        format.html { render :new }
        format.json { render json: @network_checksum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/checksum_types/1
  # PATCH/PUT /network/checksum_types/1.json
  def update
    respond_to do |format|
      if @network_checksum_type.update(network_checksum_type_params)
        format.html { redirect_to @network_checksum_type, notice: 'Checksum type was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_checksum_type }
      else
        format.html { render :edit }
        format.json { render json: @network_checksum_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/checksum_types/1
  # DELETE /network/checksum_types/1.json
  def destroy
    @network_checksum_type.destroy
    respond_to do |format|
      format.html { redirect_to network_checksum_types_url, notice: 'Checksum type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_checksum_type
      @network_checksum_type = Network::ChecksumType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_checksum_type_params
      params.require(:network_checksum_type).permit(:name, :bits)
    end
end
