class Network::FilesController < ApplicationController
  before_action :set_network_file, only: [:show, :edit, :update, :destroy]

  # GET /network/files
  # GET /network/files.json
  def index
    @network_files = Network::File.all
  end

  # GET /network/files/1
  # GET /network/files/1.json
  def show
  end

  # GET /network/files/new
  def new
    @network_file = Network::File.new
  end

  # GET /network/files/1/edit
  def edit
  end

  # POST /network/files
  # POST /network/files.json
  def create
    @network_file = Network::File.new(network_file_params)

    respond_to do |format|
      if @network_file.save
        format.html { redirect_to @network_file, notice: 'File was successfully created.' }
        format.json { render :show, status: :created, location: @network_file }
      else
        format.html { render :new }
        format.json { render json: @network_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/files/1
  # PATCH/PUT /network/files/1.json
  def update
    respond_to do |format|
      if @network_file.update(network_file_params)
        format.html { redirect_to @network_file, notice: 'File was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_file }
      else
        format.html { render :edit }
        format.json { render json: @network_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/files/1
  # DELETE /network/files/1.json
  def destroy
    @network_file.destroy
    respond_to do |format|
      format.html { redirect_to network_files_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_file
      @network_file = Network::File.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_file_params
      params.require(:network_file).permit(:full_path, :port, :url, :host_id, :path_id)
    end
end
