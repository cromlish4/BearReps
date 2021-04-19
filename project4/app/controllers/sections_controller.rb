class SectionsController < ApplicationController
  #before_action :set_section, only: %i[ show edit update destroy ]

  # GET /sections or /sections.json
  def index
    @sections = Section.all
    @courseID_list = get_matching_catalog_numbers(-1, @sections)
  end

  # GET /sections/1 or /sections/1.json
  def show
    @section = Section.find(params[:id])
    @courseID= get_matching_catalog_numbers(@section.courseID, nil)
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end


  # POST /sections or /sections.json
  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to @section
    else
      render :new
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: "Section was successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: "Section was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

  private def get_matching_catalog_numbers(courseID, sections)
    if(courseID > 0 || sections)
      if(sections)
        catalog_nums = []
        sections.each do |sect|
          item = Course.where("ROWID = ?", sect.courseID)[0]
          catalog_nums << item.catalog_number
        end
        catalog_nums
      else
        item = Course.where("ROWID = ?", courseID)[0]
        number = item.catalog_number
      end
    else
      nil
    end

  end

    # Only allow a list of trusted parameters through.
    def section_params
      params.require(:section).permit(:classNumber, :meetingDays, :meetingTimes, :waitlistTotal, :courseID, :endDate, :startDate, :enrollmentStatus, :instructionMode, :component, :section)
    end
end
