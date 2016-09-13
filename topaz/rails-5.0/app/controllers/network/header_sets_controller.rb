class Network::HeaderSetsController < Network::NetworkController
  before_action :set_network_header_set, only: [:show, :edit, :update, :destroy]

  # GET /network/header_sets
  # GET /network/header_sets.json
  def index
    @network_header_sets = Network::HeaderSet.all
  end

  # GET /network/header_sets/1
  # GET /network/header_sets/1.json
  def show
  end

  # GET /network/header_sets/new
  def new
    @network_header_set = Network::HeaderSet.new
  end

  # GET /network/header_sets/1/edit
  def edit
  end

  # POST /network/header_sets
  # POST /network/header_sets.json
  def create
    @network_header_set = Network::HeaderSet.new(network_header_set_params)

    respond_to do |format|
      if @network_header_set.save
        format.html { redirect_to @network_header_set, notice: 'Header set was successfully created.' }
        format.json { render :show, status: :created, location: @network_header_set }
      else
        format.html { render :new }
        format.json { render json: @network_header_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/header_sets/1
  # PATCH/PUT /network/header_sets/1.json
  def update
    respond_to do |format|
      if @network_header_set.update(network_header_set_params)
        format.html { redirect_to @network_header_set, notice: 'Header set was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_header_set }
      else
        format.html { render :edit }
        format.json { render json: @network_header_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/header_sets/1
  # DELETE /network/header_sets/1.json
  def destroy
    @network_header_set.destroy
    respond_to do |format|
      format.html { redirect_to network_header_sets_url, notice: 'Header set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_header_set
      @network_header_set = Network::HeaderSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_header_set_params
      params.require(:network_header_set).permit(:headers_string)
    end
end
