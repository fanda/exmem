require 'net/http'
require 'uri'

class Odorik < ActiveRecord::Base

  belongs_to :user

  attr_accessible :uid, :apik, :line


  def order_callback(called)
    auth = {'user' => self.uid, 'password' => self.apik}
    call = {'caller' => self.user.phone, 'recipient' => called, 'line' => line}

    uri = URI.parse('https://www.odorik.cz/api/v1/callback')
    request = Net::HTTP::Post.new(uri.path)
    request.form_data = auth.merge(call)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.start {|http| http.request(request)}
    unless response.body.include? 'callback_ordered'
      puts "SMS zpravu se nepodarilo odeslat. Duvod: #{response.body}"
      return false
    end
    true
  end

end


