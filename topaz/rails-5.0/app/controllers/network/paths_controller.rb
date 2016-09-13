class Network::PathsController < Network::NetworkController
  before_action :set_network_path, only: [:show, :edit, :update, :destroy]

  # GET /network/paths
  # GET /network/paths.json
  def index
    @network_paths = Network::Path.all
  end

  # GET /network/paths/1
  # GET /network/paths/1.json
  def show
  end

  # GET /network/paths/new
  def new
    @network_path = Network::Path.new
  end

  # GET /network/paths/1/edit
  def edit
  end

  # POST /network/paths
  # POST /network/paths.json
  def create
    @network_path = Network::Path.new(network_path_params)

    respond_to do |format|
      if @network_path.save
        format.html { redirect_to @network_path, notice: 'Path was successfully created.' }
        format.json { render :show, status: :created, location: @network_path }
      else
        format.html { render :new }
        format.json { render json: @network_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/paths/1
  # PATCH/PUT /network/paths/1.json
  def update
    respond_to do |format|
      if @network_path.update(network_path_params)
        format.html { redirect_to @network_path, notice: 'Path was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_path }
      else
        format.html { render :edit }
        format.json { render json: @network_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/paths/1
  # DELETE /network/paths/1.json
  def destroy
    @network_path.destroy
    respond_to do |format|
      format.html { redirect_to network_paths_url, notice: 'Path was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_path
      @network_path = Network::Path.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_path_params
      params.require(:network_path).permit(:name)
    end
end
