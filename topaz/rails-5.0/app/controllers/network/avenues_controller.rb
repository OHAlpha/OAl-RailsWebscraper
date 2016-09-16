class Network::AvenuesController < Network::NetworkController
  before_action :set_network_avenue, only: [:edit, :update, :destroy]

  # GET /network/avenues
  # GET /network/avenues.json
  def index
    @network_avenues = Network::Avenue.all
  end

  # GET /network/avenues/1
  # GET /network/avenues/1.json
  def show
    @network_avenue = Network::Avenue.includes(accesses: :jobs).find params[:id]
  end

  # GET /network/avenues/new
  def new
    @network_avenue = Network::Avenue.new
  end

  # GET /network/avenues/1/edit
  def edit
  end

  # POST /network/avenues
  # POST /network/avenues.json
  def create
    @network_avenue = Network::Avenue.new(network_avenue_params)

    respond_to do |format|
      if @network_avenue.save
        format.html { redirect_to @network_avenue, notice: 'Avenue was successfully created.' }
        format.json { render :show, status: :created, location: @network_avenue }
      else
        format.html { render :new }
        format.json { render json: @network_avenue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/avenues/1
  # PATCH/PUT /network/avenues/1.json
  def update
    respond_to do |format|
      if @network_avenue.update(network_avenue_params)
        format.html { redirect_to @network_avenue, notice: 'Avenue was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_avenue }
      else
        format.html { render :edit }
        format.json { render json: @network_avenue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/avenues/1
  # DELETE /network/avenues/1.json
  def destroy
    @network_avenue.destroy
    respond_to do |format|
      format.html { redirect_to network_avenues_url, notice: 'Avenue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_avenue
      @network_avenue = Network::Avenue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_avenue_params
      params.require(:network_avenue).permit(:protocol, :query, :url, :file_id)
    end
end
