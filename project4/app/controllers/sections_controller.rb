class SectionsController < ApplicationController
  #before_action :set_section, only: %i[ show edit update destroy ]

  # GET /sections or /sections.json
  def index
    @sections = Section.all.order(courseID: :asc)
    @courseID_list = get_matching_catalog_numbers(-1, @sections)
  end

  # GET /sections/1 or /sections/1.json
  def show
    @section = Section.find(params[:id])
    @courseID = get_matching_catalog_numbers(@section.courseID, nil)
  end

  def all
    @sections = Scrape.get_scraped_sections()
    if (@sections)
      @sections.each do |section|
        if section[0] == params[:key]
          section[1].each do |sect|
            if (Section.where("classNumber = ?", sect[0])).count == 0
              section = Section.new(classNumber: sect[0], meetingDays: sect[1]['meetingDays'], meetingTimes: sect[1]['meetingTimes'], waitlistTotal: sect[1]['waitlistTotal'], endDate: sect[1]['endDate'], startDate: sect[1]['startDate'], enrollmentStatus: sect[1]['enrollmentStatus'], instructionMode: sect[1]['instructionMode'], component: sect[1]['component'], section: sect[1]['section'], courseID: params[:courseID])
              if !section.save
                flash.alert = "Failed to add all sections"
                redirect_to home_url
              end
            end
          end
        end
      end
    end

    flash.alert = "Success!"
    redirect_to sections_url
  end

  # GET /sections/new
  def new
    @section = Section.new
    if params[:add_all]
      @sections = Scrape.get_scraped_sections()
    end
  end

  # GET /sections/1/edit
  def edit
    @section
    puts 'h'
  end

  # POST /sections or /sections.json
  def create
    if (Section.where("classNumber = ?", params[:section]['classNumber'])).count == 0
      @section = Section.new(section_params)

      if @section.save
        redirect_to @section
      else
        render :new
      end
    else
      flash.alert = "Failed To Add"
      redirect_to sections_url
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  # def update
  #   respond_to do |format|
  #     if @section.update(section_params)
  #       format.html { redirect_to @section, notice: "Section was successfully updated." }
  #       format.json { render :show, status: :ok, location: @section }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @section.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def update
    @section_to_update = Section.find(params[:id])

    @section_to_update.update(:section => params[:section][:section])
    @section_to_update.update(:classNumber => params[:section][:classNumber])
    @section_to_update.update(:meetingDays => params[:section][:meetingDays])
    @section_to_update.update(:waitlistTotal => params[:section][:waitlistTotal])
    @section_to_update.update(:enrollmentStatus => params[:section][:enrollmentStatus])
    @section_to_update.update(:instructionMode => params[:section][:instructionMode])
    @section_to_update.update(:component => params[:section][:component])
    @section_to_update.update(:startDate => params[:section][:startDate])
    @section_to_update.update(:endDate => params[:section][:endDate])
    # @section_to_update.update(:grader => params[:section][:grader])

    @section_to_update.save
    redirect_to "/admin/graders/show?id=" + params[:id]
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @section = Section.find(params[:id])
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
    if (courseID > 0 || sections)
      if (sections)
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
