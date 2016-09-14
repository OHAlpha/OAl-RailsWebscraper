class Content::ImagesController < Content::ContentController
  before_action :set_content_image, only: [:show, :edit, :update, :destroy]

  # GET /content/images
  # GET /content/images.json
  def index
    @content_images = Content::Image.all
  end

  # GET /content/images/1
  # GET /content/images/1.json
  def show
  end

  # GET /content/images/new
  def new
    @content_image = Content::Image.new
  end

  # GET /content/images/1/edit
  def edit
  end

  # POST /content/images
  # POST /content/images.json
  def create
    @content_image = Content::Image.new(content_image_params)

    respond_to do |format|
      if @content_image.save
        format.html { redirect_to @content_image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @content_image }
      else
        format.html { render :new }
        format.json { render json: @content_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content/images/1
  # PATCH/PUT /content/images/1.json
  def update
    respond_to do |format|
      if @content_image.update(content_image_params)
        format.html { redirect_to @content_image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @content_image }
      else
        format.html { render :edit }
        format.json { render json: @content_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content/images/1
  # DELETE /content/images/1.json
  def destroy
    @content_image.destroy
    respond_to do |format|
      format.html { redirect_to content_images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_image
      @content_image = Content::Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_image_params
      params.require(:content_image).permit(:width, :height)
    end
end
