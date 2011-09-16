class InvitesController < ApplicationController

  def invite_friends
  end

  def import
    
      begin
        @sites = {"gmail"  => Contacts::Gmail, "yahoo" => Contacts::Yahoo, "hotmail" => Contacts::Hotmail}
        @contacts = @sites[params[:from]].new(params[:login], params[:password]).contacts
        @users , @no_users = [], []
        @contacts.each do |contact|
          if u = User.find(:first, :conditions => "email = '{contact[1]}'" )
            @users << u
          else
            @no_users << {:name => contact[0] , :email => contact[1]}
          end
        end
        respond_to do |format|
          format.html {render :template => 'invites/_contact_list', :layout => false}
          format.xml {render :xml => @contacts.to_xml}
        end
      end
  end
end
