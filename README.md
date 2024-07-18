example params are 

{
  "n": 10,
  "filters": {
    "tags": "Community"
  }
}



curl -> 

curl --location 'http://localhost:3000/companies' \
--header 'Content-Type: application/json' \
--data '{
  "n": 10,
  "filters": {
    "tags": "Community"
  }
}'



sample output 

Name,Location,Description,YC Batch,Url
Twitch,
"San Francisco, CA, USA",A global community creating the future of live entertainment.,W07,https: //www.ycombinator.com/companies/twitch
Reddit,
"San Francisco, CA, USA",The frontpage of the internet.,S05,https: //www.ycombinator.com/companies/reddit
Leaders In Tech (formerly InnerSpace),
"San Francisco, CA, USA",
"Helping founders improve themselves, their companies, and the world.",S15,https: //www.ycombinator.com/companies/leaders-in-tech
Zidisha,
"Sterling, VA, USA",Direct P2P lending across the international wealth divide.,W14,https: //www.ycombinator.com/companies/zidisha
Socap.ai,
"San Francisco, CA, USA",Grow your network and fundraise faster with AI 🤑,W23,https: //www.ycombinator.com/companies/socap-ai
Taro,
"Redwood City, CA, USA",On-demand career courses for software engineers,S22,https: //www.ycombinator.com/companies/taro
Relay Health,
"Salt Lake City, UT, USA",Peer support to overcome addiction – the modern AA ,S22,https: //www.ycombinator.com/companies/relay-health
SolStar,
"Monterey, CA, USA",Buy and send crypto to friends on Discord.,S22,https: //www.ycombinator.com/companies/solstar
GAVEL,
"Berlin, Berlin, Germany",Live shopping marketplace,W22,https: //www.ycombinator.com/companies/gavel
Venue.live,
"Toronto, ON, Canada",Fun and interactive All Hands & AMAs for remote teams,W22,https: //www.ycombinator.com/companies/venue-live





files to look upon 

app/services/scraper_service.rb

app/controllers/companies_controller.rb

