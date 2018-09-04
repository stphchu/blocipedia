class CollaboratorsController < ApplicationController

   def new
     @collaborator = Collaborator.new
   end

   def create
     @wiki = Wiki.find(params[:wiki_id])
     @collaborator_user = User.find_by_email(params[:collaborator])
   end


end
