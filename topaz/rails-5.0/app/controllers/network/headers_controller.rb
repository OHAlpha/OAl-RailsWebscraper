class Network::HeadersController < Network::NetworkController
  before_action :set_network_header, only: [:show, :edit, :update, :destroy]

  # GET /network/headers
  # GET /network/headers.json
  def index
    @network_headers = Network::Header.all
  end

  # GET /network/headers/1
  # GET /network/headers/1.json
  def show
  end

  # GET /network/headers/new
  def new
    @network_header = Network::Header.new
  end

  # GET /network/headers/1/edit
  def edit
  end

  # POST /network/headers
  # POST /network/headers.json
  def create
    @network_header = Network::Header.new(network_header_params)

    respond_to do |format|
      if @network_header.save
        format.html { redirect_to @network_header, notice: 'Header was successfully created.' }
        format.json { render :show, status: :created, location: @network_header }
      else
        format.html { render :new }
        format.json { render json: @network_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/headers/1
  # PATCH/PUT /network/headers/1.json
  def update
    respond_to do |format|
      if @network_header.update(network_header_params)
        format.html { redirect_to @network_header, notice: 'Header was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_header }
      else
        format.html { render :edit }
        format.json { render json: @network_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/headers/1
  # DELETE /network/headers/1.json
  def destroy
    @network_header.destroy
    respond_to do |format|
      format.html { redirect_to network_headers_url, notice: 'Header was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_header
      @network_header = Network::Header.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_header_params
      params.require(:network_header).permit(:header_name, :header_value)
    end
end
