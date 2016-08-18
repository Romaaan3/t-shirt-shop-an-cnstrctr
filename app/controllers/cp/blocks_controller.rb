class Cp::BlocksController < Cp::AdminsController
  before_action :set_cp_block, only: [:show, :edit, :update, :destroy]

  # GET /cp/blocks
  # GET /cp/blocks.json
  def index
    @cp_blocks = Block.all
    @title = "Блоки"
  end

  # GET /cp/blocks/1
  # GET /cp/blocks/1.json
  def show
  end

  # GET /cp/blocks/new
  def new
    @cp_block = Block.new
  end

  # GET /cp/blocks/1/edit
  def edit
  end

  # POST /cp/blocks
  # POST /cp/blocks.json
  def create
    @cp_block = Block.new(cp_block_params)

    respond_to do |format|
      if @cp_block.save
        format.html { redirect_to cp_block_path(@cp_block), notice: 'Block was successfully created.' }
        format.json { render :show, status: :created, location: @cp_block }
      else
        format.html { render :new }
        format.json { render json: @cp_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/blocks/1
  # PATCH/PUT /cp/blocks/1.json
  def update
    respond_to do |format|
      if @cp_block.update(cp_block_params)
        format.html { redirect_to cp_block_path(@cp_block), notice: 'Block was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_block }
      else
        format.html { render :edit }
        format.json { render json: @cp_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/blocks/1
  # DELETE /cp/blocks/1.json
  def destroy
    @cp_block.destroy
    respond_to do |format|
      format.html { redirect_to cp_blocks_url, notice: 'Block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_block
      @cp_block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_block_params
      params.require(:block).permit(:name, :text, :title, :description, :keywords)
    end
end
