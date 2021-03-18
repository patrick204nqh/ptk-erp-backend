module Erp
  module ApplicationHelper

    # Get custom uniquess id
    def unique_id
      return [*5000..300000].sample.to_s
    end

    # Format date
    def format_date(date)
      date.nil? ? '' : date.strftime(t('date_format'))
    end

    # Format date
    def format_datetime(date)
      date.nil? ? '' : date.strftime(t('datetime_format'))
    end

    # Format date
    def export_partial
      "erp/elements/export.xlsx.axlsx"
    end

    # Test if string is a number
    def is_number?(object)
      true if Float(object) rescue false
    end

    def format_number(number, vn = false, round = false, precision = nil)
      prec = (number.to_f.round == number.to_f) ? 0 : 2
      prec = 0 if round

      if !precision.nil?
        prec = precision
      end

      if vn
        number_to_currency(number, precision: prec, separator: ",", unit: '', delimiter: ".", strip_insignificant_zeros: true)
      else
        number_to_currency(number, precision: prec, separator: ".", unit: '', delimiter: ",", strip_insignificant_zeros: true)
      end
    end


    @@mangso = ["không","một","hai","ba","bốn","năm","sáu","bảy","tám","chín"]
    def dochangchuc(so,daydu)
      chuoi = ""
      chuc = (so/10).to_i
      donvi = so%10

      if chuc > 1
        chuoi = " " + @@mangso[chuc] + " mươi";
        if donvi == 1
          chuoi += " mốt"
        end
      elsif chuc==1
        chuoi = " mười"
        if donvi==1
          chuoi += " một"
        end
      elsif daydu && donvi>0
        chuoi = " lẻ"
      end

      if donvi==5 && chuc>1
        chuoi += " lăm"
      elsif donvi>1 || ($donvi==1 && chuc==0)
          chuoi += " " + @@mangso[donvi]
      end
      return chuoi
    end

    def docblock(so,daydu)
      chuoi = ""
      tram = (so/100).floor
      so = so%100
      if daydu || tram>0
        chuoi = " " + @@mangso[tram] + " trăm"
        chuoi += dochangchuc(so,true)
      else
        chuoi = dochangchuc(so,false)
      end
      return chuoi;
    end

    def dochangtrieu(so,daydu)
      chuoi = ""
      trieu = (so/1000000).floor
      so = so%1000000
      if trieu>0

        chuoi = docblock(trieu,daydu) + " triệu"
        daydu = true
      end
      nghin = (so/1000).floor
      so = so%1000;
      if nghin>0
          chuoi += docblock(nghin,daydu) + " nghìn";
          daydu = true;
      end
      if so>0
          chuoi += docblock(so,daydu)
      end
      return chuoi
    end

    def docso(so)
      return @@mangso[0] if so==0
      chuoi = ""
      hauto = ""
      begin
        ty = so%1000000000
        so = (so/1000000000).floor
        if so>0
          chuoi = dochangtrieu(ty,true) + hauto + chuoi
        else
          chuoi = dochangtrieu(ty,false) + hauto + chuoi
        end
        hauto = " tỷ"
      end while so>0

      chuoi = chuoi.strip.capitalize
      chuoi = (chuoi =~ /Triệu/) == 0 ? "Một " + chuoi : chuoi
      chuoi = (chuoi =~ /Tỷ/) == 0 ? "Một " + chuoi : chuoi
      chuoi = (chuoi =~ /Nghìn/) == 0 ? "Một " + chuoi : chuoi

      return chuoi.strip.capitalize + " đồng"
    end

    # Status /list page
    def status_label(status)
      status.present? ? "<span class=\'label label-sm label-#{status}\'>#{t('.' + status)}</span>".html_safe : ''
    end

    # image src
    def image_src(image, size)
      !image.nil? ? image.image_url.send(size).url : url_for("/backend/img/placeholder.jpg")
    end

    # remove html and reuncate text
    def short_text(text, length=50)
      strip_tags(text).split[0..length-1].join(" ").gsub('&amp;','&')
    end

    # convert string to url friendly string
    def url_friendly(string)
      string.to_ascii.downcase.to_s.gsub(/[^0-9a-z ]/i, '').gsub(/ +/i, '-').strip
    end

    # display short name for user
    def user_short_name(str)
      str.rpartition(' ').last
    end

    # relative time
    def relative_time(start_time)
      diff_seconds = (Time.now - start_time).to_i
      case diff_seconds
        when 0 .. 59
          "Vừa xong"
        when 60 .. (3600-1)
          "#{diff_seconds/60} phút trước"
        when 3600 .. (3600*24-1)
          "#{diff_seconds/3600} giờ trước"
        when (3600*24) .. (3600*24*30-1)
          "#{diff_seconds/(3600*24)} ngày trước"
        when (3600*24*30) .. (3600*24*30*12-1)
          "#{diff_seconds/(3600*24*30)} tháng trước"
        else
          "#{diff_seconds/(3600*24*30*12)} năm trước"
      end
    end

    # format price
    def format_price(price)
      price = (price.to_f/1000).round*1000 if Erp::Backend.available?("online_store")
      "<span style=\'font-family:sans-serif;\'>#{number_to_currency(price, precision: 0, format: "%n₫", separator: ',', unit: '', delimiter: ".")}</span>".html_safe
    end

    # content from editor
    def format_content_from_editor(text)
      html_string = CGI.unescapeHTML(text)

      fragment = Nokogiri::HTML.fragment(html_string)
      fragment.css('video').each do |video|
          video_code = video.content # add `.strip` for possible whitespace
          div = fragment.document.create_element('div',
              class: 'video-responsive',
          )
          iframe = fragment.document.create_element('iframe',
              class: 'responsive-iframe',
              src: "https://www.youtube.com/embed/#{video_code}",
              frameborder: '0',
              allowfullscreen: true,
          )
          div << iframe
          video.swap(div)
      end

      return fragment.to_s.html_safe
    end
  end
end