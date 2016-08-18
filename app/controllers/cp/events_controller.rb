class Cp::EventsController < Cp::AdminsController
  before_action :set_cp_event, only: [:show, :edit, :update, :destroy]

  # GET /cp/events
  # GET /cp/events.json
  def index
    @cp_events = Event.paginate(:page => params[:page], :per_page => 10).order('id DESC')
    @title = "События"
  end

  # GET /cp/events/1
  # GET /cp/events/1.json
  def show
  end

  # GET /cp/events/new
  def new
    @cp_event = Event.new
  end

  # GET /cp/events/1/edit
  def edit
  end

  # POST /cp/events
  # POST /cp/events.json
  def create
    @cp_event = Event.new(cp_event_params)

    respond_to do |format|
      if @cp_event.save
        format.html { redirect_to cp_event_path(@cp_event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @cp_event }
      else
        format.html { render :new }
        format.json { render json: @cp_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/events/1
  # PATCH/PUT /cp/events/1.json
  def update
    respond_to do |format|
      if @cp_event.update(cp_event_params)
        format.html { redirect_to cp_event_path(@cp_event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp_event }
      else
        format.html { render :edit }
        format.json { render json: @cp_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/events/1
  # DELETE /cp/events/1.json
  def destroy
    @cp_event.destroy
    respond_to do |format|
      format.html { redirect_to cp_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp_event
      @cp_event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_event_params
      params.require(:event).permit(:title, :anons, :description, :photo)
    end
end
