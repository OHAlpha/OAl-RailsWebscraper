class Content::HtmlDocumentsController < Content::ContentController
  before_action :set_content_html_document, only: [:show, :edit, :update, :destroy]

  # GET /content/html_documents
  # GET /content/html_documents.json
  def index
    @content_html_documents = Content::HtmlDocument.all
  end

  # GET /content/html_documents/1
  # GET /content/html_documents/1.json
  def show
  end

  # GET /content/html_documents/new
  def new
    @content_html_document = Content::HtmlDocument.new
  end

  # GET /content/html_documents/1/edit
  def edit
  end

  # POST /content/html_documents
  # POST /content/html_documents.json
  def create
    @content_html_document = Content::HtmlDocument.new(content_html_document_params)

    respond_to do |format|
      if @content_html_document.save
        format.html { redirect_to @content_html_document, notice: 'Html document was successfully created.' }
        format.json { render :show, status: :created, location: @content_html_document }
      else
        format.html { render :new }
        format.json { render json: @content_html_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content/html_documents/1
  # PATCH/PUT /content/html_documents/1.json
  def update
    respond_to do |format|
      if @content_html_document.update(content_html_document_params)
        format.html { redirect_to @content_html_document, notice: 'Html document was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_html_document }
      else
        format.html { render :edit }
        format.json { render json: @content_html_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/html_documents/1
  # DELETE /content/html_documents/1.json
  def destroy
    @content_html_document.destroy
    respond_to do |format|
      format.html { redirect_to content_html_documents_url, notice: 'Html document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_html_document
      @content_html_document = Content::HtmlDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_html_document_params
      params.require(:content_html_document).permit(:title, :links_count)
    end
end
