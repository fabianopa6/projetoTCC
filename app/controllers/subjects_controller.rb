class SubjectsController < ApplicationController

	before_action :find_subject, only: [:show, :edit, :update, :destroy]

	def index
		@subjects = Subject.all.order("created_at DESC")		
	end

	def show
	
	end

	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new(subject_params)

		if @subject.save
			redirect_to root_path
		else
			render 'new'	
		end
	end


		private

		def subject_params
			params.require(:subject).permit(:name, :semester)
		end

		def find_subject
			@subject = Subject.find(params[:id])
		end
end
