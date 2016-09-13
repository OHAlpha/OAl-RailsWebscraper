class Network::ChecksumsController < Network::NetworkController
  before_action :set_network_checksum, only: [:show, :edit, :update, :destroy]

  # GET /network/checksums
  # GET /network/checksums.json
  def index
    @network_checksums = Network::Checksum.all
  end

  # GET /network/checksums/1
  # GET /network/checksums/1.json
  def show
  end

  # GET /network/checksums/new
  def new
    @network_checksum = Network::Checksum.new
  end

  # GET /network/checksums/1/edit
  def edit
  end

  # POST /network/checksums
  # POST /network/checksums.json
  def create
    @network_checksum = Network::Checksum.new(network_checksum_params)

    respond_to do |format|
      if @network_checksum.save
        format.html { redirect_to @network_checksum, notice: 'Checksum was successfully created.' }
        format.json { render :show, status: :created, location: @network_checksum }
      else
        format.html { render :new }
        format.json { render json: @network_checksum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/checksums/1
  # PATCH/PUT /network/checksums/1.json
  def update
    respond_to do |format|
      if @network_checksum.update(network_checksum_params)
        format.html { redirect_to @network_checksum, notice: 'Checksum was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_checksum }
      else
        format.html { render :edit }
        format.json { render json: @network_checksum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/checksums/1
  # DELETE /network/checksums/1.json
  def destroy
    @network_checksum.destroy
    respond_to do |format|
      format.html { redirect_to network_checksums_url, notice: 'Checksum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_checksum
      @network_checksum = Network::Checksum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_checksum_params
      params.require(:network_checksum).permit(:value, :bits, :hex, :type_id)
    end
end
