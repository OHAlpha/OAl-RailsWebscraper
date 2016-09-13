class Content::DocumentsController < ApplicationController
  before_action :set_content_document, only: [:show, :edit, :update, :destroy]

  # GET /content/documents
  # GET /content/documents.json
  def index
    @content_documents = Content::Document.all
  end

  # GET /content/documents/1
  # GET /content/documents/1.json
  def show
  end

  # GET /content/documents/new
  def new
    @content_document = Content::Document.new
  end

  # GET /content/documents/1/edit
  def edit
  end

  # POST /content/documents
  # POST /content/documents.json
  def create
    @content_document = Content::Document.new(content_document_params)

    respond_to do |format|
      if @content_document.save
        format.html { redirect_to @content_document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @content_document }
      else
        format.html { render :new }
        format.json { render json: @content_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content/documents/1
  # PATCH/PUT /content/documents/1.json
  def update
    respond_to do |format|
      if @content_document.update(content_document_params)
        format.html { redirect_to @content_document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_document }
      else
        format.html { render :edit }
        format.json { render json: @content_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/documents/1
  # DELETE /content/documents/1.json
  def destroy
    @content_document.destroy
    respond_to do |format|
      format.html { redirect_to content_documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_document
      @content_document = Content::Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_document_params
      params.require(:content_document).permit(:avenue_id, :source_id, :contents_count)
    end
end
