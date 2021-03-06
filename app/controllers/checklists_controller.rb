require 'net/http'

class ChecklistsController < ApplicationController

  def get_remote_vehicles
    # url = URI.parse('http://localhost:3010/vehicles.json?callsign=11')
    # # req = Net::HTTP::Get.new(url.path)
    # req = Net::HTTP::Get.new("http://localhost:3002/vehicles.json?callsign=1")
    # res = Net::HTTP.start(url.host, url.port) {|http|
    # http.request(req)
    # }
    # parsed_json = ActiveSupport::JSON.decode(res.body)
    # raise parsed_json.inspect
    callsign = params[:callsign]
    remote_vehicles_url = "http://localhost:3010/vehicles.json?callsign=#{callsign}"
    url = URI.parse(remote_vehicles_url)
    req = Net::HTTP::Get.new(remote_vehicles_url)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    respond_to do |format|
      format.json { render json: res.body }
    end
  end

  # GET /checklists
  # GET /checklists.json
  def index
    @checklists = Checklist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checklists }
    end
  end

  # GET /checklists/1
  # GET /checklists/1.json
  def show
    @checklist = Checklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checklist }
    end
  end

  # GET /checklists/new
  # GET /checklists/new.json
  def new
    @checklist = Checklist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checklist }
    end
  end

  # GET /checklists/1/edit
  def edit
    @checklist = Checklist.find(params[:id])
  end

  # POST /checklists
  # POST /checklists.json
  def create
    @checklist = Checklist.new(params[:checklist])

    respond_to do |format|
      if @checklist.save
        format.html { redirect_to @checklist, notice: 'Checklist was successfully created.' }
        format.json { render json: @checklist, status: :created, location: @checklist }
      else
        format.html { render action: "new" }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checklists/1
  # PUT /checklists/1.json
  def update
    @checklist = Checklist.find(params[:id])

    respond_to do |format|
      if @checklist.update_attributes(params[:checklist])
        format.html { redirect_to @checklist, notice: 'Checklist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @checklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checklists/1
  # DELETE /checklists/1.json
  def destroy
    @checklist = Checklist.find(params[:id])
    @checklist.destroy

    respond_to do |format|
      format.html { redirect_to checklists_url }
      format.json { head :no_content }
    end
  end

end
