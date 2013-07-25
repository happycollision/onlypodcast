xml.instruct! :xml, :version => "1.0" 
xml.rss 'version' => "2.0", 'xmlns:dc' => "http://purl.org/dc/elements/1.1/", 'xmlns:sy' => "http://purl.org/rss/1.0/modules/syndication/", 'xmlns:admin' => "http://webns.net/mvcb/",	'xmlns:atom' => "http://www.w3.org/2005/Atom/",	'xmlns:rdf' => "http://www.w3.org/1999/02/22-rdf-syntax-ns#",	'xmlns:content' => "http://purl.org/rss/1.0/modules/content/",	'xmlns:itunes' => "http://www.itunes.com/dtds/podcast-1.0.dtd" do
  xml.channel do
    xml.title @podcast.title
    xml.link "http://#{request.host_with_port}"
    xml.pubDate @podcast.episodes[0].date.to_s(:rfc822)
    xml.description @podcast.description
		xml.language 'en-us'
		
		#xml.itunes :new-feed-url, 'http://theonlypodcastontheinternet.com/feeds/onlypodcast'
    #<itunes:new-feed-url>http://theonlypodcastontheinternet.com/feeds/onlypodcast</itunes:new-feed-url>
    
    # xml.itunes :subtitle, @podcast.title
		
    xml.itunes :author, 'Happy Collision'
    xml.itunes :summary, @podcast.description
    xml.itunes :image, :href => "http://#{request.host_with_port}/files/#{@podcast.slug}/topcoti.jpg"
    xml.itunes :keywords, @podcast.keywords
    xml.itunes :explicit, @podcast.explicit.yesno
    xml.itunes :owner do
     xml.itunes :name, 'Happy Collision'
     xml.itunes :email, 'don@happycollision.com'
    end
    xml.itunes :category, :text => 'Arts' do
      xml.itunes :category, :text => 'Performing Arts'
      xml.itunes :category, :text => 'Visual Arts'
    end

    
    for ep in @podcast.episodes
      xml.item do
        xml.title "#{@podcast.title} Ep.#{ep.number}: #{ep.title}"
        xml.link "http://#{request.host_with_port}/#{ep.number}"
        xml.guid "http://#{request.host_with_port}/#{ep.number}"
        xml.pubDate ep.date.to_s(:rfc822)
        xml.author 'don@happycollision.com (Don Denton)'
        xml.description strip_tags(ep.description)
        xml.enclosure :url => ep.file_location, :length => ep.file_size, :type => 'audio/mpeg'
				xml.content :encoded, "<h3>Show Notes:</h3> #{ep.description} #{ep.show_notes}"
        xml.itunes :author, @podcast.author
        xml.itunes :duration, ep.duration
        xml.itunes :subtitle, ep.xml_subtitle
        xml.itunes :summary, ep.description
        # xml.itunes :explicit, ep.explicit.yesno
        xml.itunes :keywords, ep.keywords
        xml.itunes :image, :href => ep.art_location

      end
    end
  end
end