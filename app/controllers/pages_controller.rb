class PagesController < ApplicationController

  def home
      @json = Company.all.to_gmaps4rails do |company,marker|
        p = "/" + I18n.locale.to_s + "/companies/" + company.id.to_s
        image = company.image.medium.to_s
        marker.infowindow(
          "<a href='#{p}'>
          <img src='#{image}' style='text-align:middle;'>
          </a>"
        )
      end
      @companies = Company.all
      @people = Person.all
      @events = Event.all      
      @jobs = Job.all

  end

  def about
    @json = Company.all.to_gmaps4rails
  end

end