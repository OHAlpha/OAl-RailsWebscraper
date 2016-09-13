class Content::ContentDocumentsController < ApplicationController
  before_action :set_content_content_document, only: [:show, :edit, :update, :destroy]

  # GET /content/content_documents
  # GET /content/content_documents.json
  def index
    @content_content_documents = Content::ContentDocument.all
  end

  # GET /content/content_documents/1
  # GET /content/content_documents/1.json
  def show
  end

  # GET /content/content_documents/new
  def new
    @content_content_document = Content::ContentDocument.new
  end

  # GET /content/content_documents/1/edit
  def edit
  end

  # POST /content/content_documents
  # POST /content/content_documents.json
  def create
    @content_content_document = Content::ContentDocument.new(content_content_document_params)

    respond_to do |format|
      if @content_content_document.save
        format.html { redirect_to @content_content_document, notice: 'Content document was successfully created.' }
        format.json { render :show, status: :created, location: @content_content_document }
      else
        format.html { render :new }
        format.json { render json: @content_content_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content/content_documents/1
  # PATCH/PUT /content/content_documents/1.json
  def update
    respond_to do |format|
      if @content_content_document.update(content_content_document_params)
        format.html { redirect_to @content_content_document, notice: 'Content document was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_content_document }
      else
        format.html { render :edit }
        format.json { render json: @content_content_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/content_documents/1
  # DELETE /content/content_documents/1.json
  def destroy
    @content_content_document.destroy
    respond_to do |format|
      format.html { redirect_to content_content_documents_url, notice: 'Content document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_content_document
      @content_content_document = Content::ContentDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_content_document_params
      params.require(:content_content_document).permit(:document_id)
    end
end
