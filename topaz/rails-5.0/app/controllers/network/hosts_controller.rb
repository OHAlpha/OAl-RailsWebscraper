class Network::HostsController < ApplicationController
  before_action :set_network_host, only: [:show, :edit, :update, :destroy]

  # GET /network/hosts
  # GET /network/hosts.json
  def index
    @network_hosts = Network::Host.all
  end

  # GET /network/hosts/1
  # GET /network/hosts/1.json
  def show
  end

  # GET /network/hosts/new
  def new
    @network_host = Network::Host.new
  end

  # GET /network/hosts/1/edit
  def edit
  end

  # POST /network/hosts
  # POST /network/hosts.json
  def create
    @network_host = Network::Host.new(network_host_params)

    respond_to do |format|
      if @network_host.save
        format.html { redirect_to @network_host, notice: 'Host was successfully created.' }
        format.json { render :show, status: :created, location: @network_host }
      else
        format.html { render :new }
        format.json { render json: @network_host.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/hosts/1
  # PATCH/PUT /network/hosts/1.json
  def update
    respond_to do |format|
      if @network_host.update(network_host_params)
        format.html { redirect_to @network_host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_host }
      else
        format.html { render :edit }
        format.json { render json: @network_host.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/hosts/1
  # DELETE /network/hosts/1.json
  def destroy
    @network_host.destroy
    respond_to do |format|
      format.html { redirect_to network_hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_host
      @network_host = Network::Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_host_params
      params.require(:network_host).permit(:host_name)
    end
end
