class Rss < AbstractBox

  set_table_name 'rss_boxes'

  attr_accessible :title, :url, :feeds

  after_save :mix!, :unless => 'self.feeds.blank?'

  before_validation :keygen


  def keygen(force=false)
    unless self.key or force
      self.key = Time.now.to_i.to_s.reverse + '_rss'
      sleep 1  # never generate same key
    end
  end


  def mix!
      #Mechanize.post 'http://www.rssmix.com/engine.php' do
        #:urls => self.feeds
        #:mix_title => self.title
        #:action => 'Create!'
      #end
      #self.url = result
  end

end
