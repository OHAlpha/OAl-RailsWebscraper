class Network::DomainsController < ApplicationController
  before_action :set_network_domain, only: [:show, :edit, :update, :destroy]

  # GET /network/domains
  # GET /network/domains.json
  def index
    @network_domains = Network::Domain.all
  end

  # GET /network/domains/1
  # GET /network/domains/1.json
  def show
  end

  # GET /network/domains/new
  def new
    @network_domain = Network::Domain.new
  end

  # GET /network/domains/1/edit
  def edit
  end

  # POST /network/domains
  # POST /network/domains.json
  def create
    @network_domain = Network::Domain.new(network_domain_params)

    respond_to do |format|
      if @network_domain.save
        format.html { redirect_to @network_domain, notice: 'Domain was successfully created.' }
        format.json { render :show, status: :created, location: @network_domain }
      else
        format.html { render :new }
        format.json { render json: @network_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/domains/1
  # PATCH/PUT /network/domains/1.json
  def update
    respond_to do |format|
      if @network_domain.update(network_domain_params)
        format.html { redirect_to @network_domain, notice: 'Domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_domain }
      else
        format.html { render :edit }
        format.json { render json: @network_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/domains/1
  # DELETE /network/domains/1.json
  def destroy
    @network_domain.destroy
    respond_to do |format|
      format.html { redirect_to network_domains_url, notice: 'Domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_domain
      @network_domain = Network::Domain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_domain_params
      params.require(:network_domain).permit(:name)
    end
end
