class ApplicantsController < ApplicationController

  # GET /applicants
  # GET /applicants.json
  def index
    @applicants = Applicant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @applicants }
    end
  end

  # GET /applicants/review
  # GET /applicants/review.json
  def review
	@applicants = Applicant.all
	
	respond_to do |format|
	format.html # review.html.erb
	format.json { render json: @applicants }
	end
	end	
  
 
  def show
    @applicant = Applicant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @applicant }
    end
  end
  
  
   def isValid(email)
		if email.length != 0 
			@input1 = email
			@result = ValidEmail.runcheck(email)
			return @result
		else
			return true
		end	
	end	
  
  
  def new
		@applicant = Applicant.new

		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @applicant }
	  
		end
	end
	


  

  

  def update
    @applicant = Applicant.find(params[:id])

    respond_to do |format|
      if @applicant.update_attributes(params[:applicant])
        format.html { redirect_to @applicant, notice: 'App was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # POST /applicants
  # POST /applicants
  def create
	obj = params[:applicant]
	
	if obj['email']
	@email = obj['email']
	@valid = isValid(@email)
	else
	@email = "";
	end
	
	if @valid == "valid" 
		@applicant = Applicant.new(params[:applicant])

		respond_to do |format|
			if @applicant.save
				format.html { redirect_to @applicant, notice: 'Application form was successfully submitted.' }
				format.json { render json: @applicant, status: :created, location: @applicant }
			else
				format.html { render action: "new" }
				format.json { render json: @applicant.errors, status: :unprocessable_entity }
			end
		end	
	else
		respond_to do |format|
			format.html { render action: "invalid", notice: 'Invalid Email' }
		end
	end
  end
  
  def invalid
	flash[:notice] = "Email Invalid"
  end
end