class Content::ContentUsesController < Content::ContentController
  before_action :set_content_content_use, only: [:show, :edit, :update, :destroy]

  # GET /content/content_uses
  # GET /content/content_uses.json
  def index
    @content_content_uses = Content::ContentUse.all
  end

  # GET /content/content_uses/1
  # GET /content/content_uses/1.json
  def show
  end

  # GET /content/content_uses/new
  def new
    @content_content_use = Content::ContentUse.new
  end

  # GET /content/content_uses/1/edit
  def edit
  end

  # POST /content/content_uses
  # POST /content/content_uses.json
  def create
    @content_content_use = Content::ContentUse.new(content_content_use_params)

    respond_to do |format|
      if @content_content_use.save
        format.html { redirect_to @content_content_use, notice: 'Content use was successfully created.' }
        format.json { render :show, status: :created, location: @content_content_use }
      else
        format.html { render :new }
        format.json { render json: @content_content_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content/content_uses/1
  # PATCH/PUT /content/content_uses/1.json
  def update
    respond_to do |format|
      if @content_content_use.update(content_content_use_params)
        format.html { redirect_to @content_content_use, notice: 'Content use was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_content_use }
      else
        format.html { render :edit }
        format.json { render json: @content_content_use.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/content_uses/1
  # DELETE /content/content_uses/1.json
  def destroy
    @content_content_use.destroy
    respond_to do |format|
      format.html { redirect_to content_content_uses_url, notice: 'Content use was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_content_use
      @content_content_use = Content::ContentUse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_content_use_params
      params.require(:content_content_use).permit(:document_id, :content_id)
    end
end
