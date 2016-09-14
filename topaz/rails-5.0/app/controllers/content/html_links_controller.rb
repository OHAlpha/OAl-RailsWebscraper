class Content::HtmlLinksController < Content::ContentController
  before_action :set_content_html_link, only: [:show, :edit, :update, :destroy]

  # GET /content/html_links
  # GET /content/html_links.json
  def index
    @content_html_links = Content::HtmlLink.all
  end

  # GET /content/html_links/1
  # GET /content/html_links/1.json
  def show
  end

  # GET /content/html_links/new
  def new
    @content_html_link = Content::HtmlLink.new
  end

  # GET /content/html_links/1/edit
  def edit
  end

  # POST /content/html_links
  # POST /content/html_links.json
  def create
    @content_html_link = Content::HtmlLink.new(content_html_link_params)

    respond_to do |format|
      if @content_html_link.save
        format.html { redirect_to @content_html_link, notice: 'Html link was successfully created.' }
        format.json { render :show, status: :created, location: @content_html_link }
      else
        format.html { render :new }
        format.json { render json: @content_html_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content/html_links/1
  # PATCH/PUT /content/html_links/1.json
  def update
    respond_to do |format|
      if @content_html_link.update(content_html_link_params)
        format.html { redirect_to @content_html_link, notice: 'Html link was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_html_link }
      else
        format.html { render :edit }
        format.json { render json: @content_html_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/html_links/1
  # DELETE /content/html_links/1.json
  def destroy
    @content_html_link.destroy
    respond_to do |format|
      format.html { redirect_to content_html_links_url, notice: 'Html link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_html_link
      @content_html_link = Content::HtmlLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_html_link_params
      params.require(:content_html_link).permit(:source_id, :target_id)
    end
end
