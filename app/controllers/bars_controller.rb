class BarsController < ApplicationController
  # GET /bars
  # GET /bars.json

  def index
     # Get Bar areas
    @areas = Bar.all_areas
    @selected_areas = params[:areas] ||session[:areas] || {}
    if @selected_areas == {}
      @selected_areas = Hash[@areas.map {|area| [area, area]}]
    end
    
    # barList = Bar.find(:all)
    # @start_time = params[:startTime]
    # @end_time = params[:endTime]
    # newList = []

    # barList.each do |bar| {
    #   if bar.start_time >= @start_time && bar.start_time <= @end_time
    #     newList << bar
    #   end
    # }

    if params[:areas] != session[:areas] 
      session[:areas] = @selected_areas
      redirect_to :areas => @selected_areas and return
    end
    if params[:search] != nil
      @bars = Bar.search(params[:search])
      @selected_areas = Hash[@areas.map {|area| [area, area]}]
    else
      @bars = Bar.find_all_by_area(@selected_areas.keys)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bars }
    end
  end

  def rate
    value = params[:type] == "up" ? 1 : -1
    @bar = Bar.find(params[:id])
    @bar.add_or_update_evaluation(:ratings, value, current_user)
    redirect_to :back, notice: "Thank you for voting"
  end

  def convert_to_time
    @string = self.to_s
    if @string.match(/.0/)
      @string.gsub(/.0/, ":00")
    else
      @string.gsub(/.5/, ":30" )
    end
  end

  # GET /bars/1
  # GET /bars/1.json
  def show
    @bar = Bar.find(params[:id])

#    @area_num = params[:area]
#    if @area_num == 0
#      @area = "Downtown"
#    end
    #render :text =>  #params[:id]
  end

  # GET /bars/new
  # GET /bars/new.json
  def new
    @bar = Bar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bar }
    end
  end

  # GET /bars/1/edit
  def edit
    @bar = Bar.find(params[:id])
  end

  # POST /bars
  # POST /bars.json
  def create
    @bar = Bar.new(params[:bar])

    respond_to do |format|
      if @bar.save
        format.html { redirect_to @bar, notice: 'Bar was successfully created.' }
        format.json { render json: @bar, status: :created, location: @bar }
      else
        format.html { render action: "new" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bars/1
  # PUT /bars/1.json
  def update
    @bar = Bar.find(params[:id])

    respond_to do |format|
      if @bar.update_attributes(params[:bar])
        format.html { redirect_to @bar, notice: 'Bar was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @bar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bars/1
  # DELETE /bars/1.json
  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy

    respond_to do |format|
      format.html { redirect_to bars_url }
      format.json { head :ok }
    end
  end
end
