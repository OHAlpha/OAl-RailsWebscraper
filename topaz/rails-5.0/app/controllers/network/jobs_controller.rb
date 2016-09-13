class Network::JobsController < Network::NetworkController
  before_action :set_network_job, only: [:show, :edit, :update, :destroy]

  # GET /network/jobs
  # GET /network/jobs.json
  def index
    @network_jobs = Network::Job.all
  end

  # GET /network/jobs/1
  # GET /network/jobs/1.json
  def show
  end

  # GET /network/jobs/new
  def new
    @network_job = Network::Job.new
  end

  # GET /network/jobs/1/edit
  def edit
  end

  # POST /network/jobs
  # POST /network/jobs.json
  def create
    @network_job = Network::Job.new(network_job_params)

    respond_to do |format|
      if @network_job.save
        format.html { redirect_to @network_job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @network_job }
      else
        format.html { render :new }
        format.json { render json: @network_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network/jobs/1
  # PATCH/PUT /network/jobs/1.json
  def update
    respond_to do |format|
      if @network_job.update(network_job_params)
        format.html { redirect_to @network_job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_job }
      else
        format.html { render :edit }
        format.json { render json: @network_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network/jobs/1
  # DELETE /network/jobs/1.json
  def destroy
    @network_job.destroy
    respond_to do |format|
      format.html { redirect_to network_jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_job
      @network_job = Network::Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_job_params
      params.require(:network_job).permit(:priority, :size, :downloaded, :status, :message, :long_message, :access_id)
    end
end
