module ApplicationHelper

  def headermap(size=nil)
    gmaps({
      :markers => {
        "data" => @json,
        "options" => {
          :do_clustering => true,
          "rich_marker" => true
          }
        },
      :map_options => { 
        :language => I18n.locale,
        :hl => I18n.locale,
        :region => 'CN',
      :raw => '{
        scrollwheel: false,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP,google.maps.MapTypeId.SATELLITE]
        } }',
      "type" => "ROADMAP",
      # "center_latitude" => "31.218087",
      # "center_longitude" => "121.475658",
      "auto_zoom" => true,
      "zoom" => 13,
      "auto_adjust" => true
        }
      })
  end

  def companymap
    gmaps({
      :markers => {
        "data" => @json,
        },
      :map_options => { 
        :language => I18n.locale,
        :hl => I18n.locale,
        :region => 'CN',
        :center_latitude => @lat,
        :center_longitude=> @lng,
        :zoom => 14,

      :raw => '{
        scrollwheel: false,
        mapTypeControlOptions: { mapTypeIds: [google.maps.MapTypeId.ROADMAP,google.maps.MapTypeId.SATELLITE] } }',
        "auto_adjust" => false,
        }
      })
  end

  def companynewmap
    gmaps({
      :markers => { "data" => @json, "options" => { "draggable" => true, "rich_marker" => false } },
      :map_options => { 
      :raw => '{
        scrollwheel: false,
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP,google.maps.MapTypeId.SATELLITE]
        } }',
      "type" => "ROADMAP",
      "center_latitude" => "31.218087",
      "center_longitude" => "121.475658",
      "auto_zoom" => false,
      "zoom" => 13,
      "auto_adjust" => true
        }
      })
  end

  def image_url(source)
    abs_path = image_path(source)
    unless abs_path =~ /^http/
      abs_path = "#{request.protocol}#{request.host_with_port}#{abs_path}"
    end
   abs_path
  end
  
  def full_image_path(img_path)
      request.protocol + request.host_with_port + image_path(img_path)
  end
  def current_avatar
    if current_user.person.nil? 
      image = avatar_url(current_user)
    else
      image = current_user.person.image
    end
    image
  end

  def avatar_url(user,size=270)
      #default_url = "#{root_url}images/guest.png"
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      # "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=mm"
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def icon(name, size=1)
    #icon("camera-retro")
    #<i class="icon-camera-retro"></i> 
    
    html = "<i class='icon-#{name}' "
    html += "style='font-size:#{size}em' "
    html += "></i>"
    html.html_safe
  end
  
  def button_icon(text, url, name, size=1.5, *options)
    #button_icon("Camera Retro button", "#","refresh",1)
		#<a class="button refresh" href="#"><i style="font-size:1.5em" class="icon-refresh"></i> Camera Retro button</a>
    html_options=''
    class_to_add = "btn btn-large button #{name}"
    options.each { |opt| class_to_add += " #{opt}" } if !options.empty?
    link_to(url, html_options = { :class => class_to_add }) {icon(name, 1.5) + " " + text}
  end

  def button_icon_info(text, url, name, size=1.5, *options)
    #button_icon("Camera Retro button", "#","refresh",1)
    #<a class="button refresh" href="#"><i style="font-size:1.5em" class="icon-refresh"></i> Camera Retro button</a>
    html_options=''
    class_to_add = "btn btn-large btn-info button #{name}"
    options.each { |opt| class_to_add += " #{opt}" } if !options.empty?
    link_to(url, html_options = { :class => class_to_add }) {icon(name, 1.5) + " " + text}
  end
  
  def link_icon(text, url, name, size=1, *options)
    #link_icon("Camera Retro button", "#","refresh",1)
    # <a class="refresh" href="#"><i style="font-size:1.5em" class="icon-refresh"></i> Camera Retro button</a>
    html_options=''
    class_to_add = "#{name}"
    options.each { |opt| class_to_add += " #{opt}" } if !options.empty?
    link_to(url, html_options = { :class => class_to_add }) {icon(name, size) + " " + text}
  end

  def nav_link(text, link)
      recognized = Rails.application.routes.recognize_path(link)
      if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
          content_tag(:li, :class => "active") do
              link_to( text, link)
          end
      else
          content_tag(:li) do
              link_to( text, link)
          end
      end
  end

  def nav_link_icon(text, link, icon)
    recognized = Rails.application.routes.recognize_path(link)
    if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
        content_tag(:li, :class => "active") do
            link_icon( text, link, icon)
        end
    else
        content_tag(:li) do
            link_icon( text, link, icon)
        end
    end
  end


end
