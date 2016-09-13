class Network::HeaderInclusionsController < Network::NetworkController
  before_action :set_network_header_inclusion, only: [:show, :edit, :update, :destroy]

  # GET /network/header_inclusions
  # GET /network/header_inclusions.json
  def index
    @network_header_inclusions = Network::HeaderInclusion.all
  end

  # GET /network/header_inclusions/1
  # GET /network/header_inclusions/1.json
  def show
  end

  # GET /network/header_inclusions/new
  def new
    @network_header_inclusion = Network::HeaderInclusion.new
  end

  # GET /network/header_inclusions/1/edit
  def edit
  end

  # POST /network/header_inclusions
  # POST /network/header_inclusions.json
  def create
    @network_header_inclusion = Network::HeaderInclusion.new(network_header_inclusion_params)

    respond_to do |format|
      if @network_header_inclusion.save
        format.html { redirect_to @network_header_inclusion, notice: 'Header inclusion was successfully created.' }
        format.json { render :show, status: :created, location: @network_header_inclusion }
      else
        format.html { render :new }
        format.json { render json: @network_header_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/header_inclusions/1
  # PATCH/PUT /network/header_inclusions/1.json
  def update
    respond_to do |format|
      if @network_header_inclusion.update(network_header_inclusion_params)
        format.html { redirect_to @network_header_inclusion, notice: 'Header inclusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_header_inclusion }
      else
        format.html { render :edit }
        format.json { render json: @network_header_inclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/header_inclusions/1
  # DELETE /network/header_inclusions/1.json
  def destroy
    @network_header_inclusion.destroy
    respond_to do |format|
      format.html { redirect_to network_header_inclusions_url, notice: 'Header inclusion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_header_inclusion
      @network_header_inclusion = Network::HeaderInclusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_header_inclusion_params
      params.require(:network_header_inclusion).permit(:set_id, :header_id)
    end
end
