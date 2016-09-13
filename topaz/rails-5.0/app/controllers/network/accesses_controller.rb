class Network::AccessesController < Network::NetworkController
  before_action :set_network_access, only: [:show, :edit, :update, :destroy]

  # GET /network/accesses
  # GET /network/accesses.json
  def index
    @network_accesses = Network::Access.all
  end

  # GET /network/accesses/1
  # GET /network/accesses/1.json
  def show
  end

  # GET /network/accesses/new
  def new
    @network_access = Network::Access.new
  end

  # GET /network/accesses/1/edit
  def edit
  end

  # POST /network/accesses
  # POST /network/accesses.json
  def create
    @network_access = Network::Access.new(network_access_params)

    respond_to do |format|
      if @network_access.save
        format.html { redirect_to @network_access, notice: 'Access was successfully created.' }
        format.json { render :show, status: :created, location: @network_access }
      else
        format.html { render :new }
        format.json { render json: @network_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/accesses/1
  # PATCH/PUT /network/accesses/1.json
  def update
    respond_to do |format|
      if @network_access.update(network_access_params)
        format.html { redirect_to @network_access, notice: 'Access was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_access }
      else
        format.html { render :edit }
        format.json { render json: @network_access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/accesses/1
  # DELETE /network/accesses/1.json
  def destroy
    @network_access.destroy
    respond_to do |format|
      format.html { redirect_to network_accesses_url, notice: 'Access was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_access
      @network_access = Network::Access.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_access_params
      params.require(:network_access).permit(:request_method, :request_auxillary_headers, :request_cookie, :request_range, :request_body, :request_length, :request_md5, :request_type, :response_code, :response_headers, :response_cookie, :response_body, :created, :accessed, :avenue_id, :request_headers_id)
    end
end
