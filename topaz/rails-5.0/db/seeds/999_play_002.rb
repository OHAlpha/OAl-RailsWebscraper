Network::Avenue.find_or_create_by! url: 'https://ide.c9.io/oalpha/playground?project=webscraper&branch=play.002' do |ave|
    ave.priority = Network::Job.skip_priority
end
Network::Avenue.find_or_create_by! url: 'https://en.wikipedia.org/wiki/Antimatter' do |ave|
    ave.priority = Network::Job.highest_priority
end