class Content::ContentsController < Content::ContentController
  before_action :set_content_content, only: [:show, :edit, :update, :destroy]

  # GET /content/contents
  # GET /content/contents.json
  def index
    @content_contents = Content::Content.all
  end

  # GET /content/contents/1
  # GET /content/contents/1.json
  def show
  end

  # GET /content/contents/new
  def new
    @content_content = Content::Content.new
  end

  # GET /content/contents/1/edit
  def edit
  end

  # POST /content/contents
  # POST /content/contents.json
  def create
    @content_content = Content::Content.new(content_content_params)

    respond_to do |format|
      if @content_content.save
        format.html { redirect_to @content_content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content_content }
      else
        format.html { render :new }
        format.json { render json: @content_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content/contents/1
  # PATCH/PUT /content/contents/1.json
  def update
    respond_to do |format|
      if @content_content.update(content_content_params)
        format.html { redirect_to @content_content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_content }
      else
        format.html { render :edit }
        format.json { render json: @content_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/contents/1
  # DELETE /content/contents/1.json
  def destroy
    @content_content.destroy
    respond_to do |format|
      format.html { redirect_to content_contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_content
      @content_content = Content::Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_content_params
      params.require(:content_content).permit(:avenue_id, :source_id, :references_count)
    end
end
