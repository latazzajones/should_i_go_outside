# README

This application wouldn't be possible without these two great APIs:  
 - https://docs.openaq.org  
 - https://openweathermap.org/current

### Currently this app only runs locally. To get it working in your dev environment do the following: 

1. Create an api key for [OpenWeather](https://openweathermap.org/appid) if you don't have one.
1. Set this api key to the environment variable `open_weather_key`. 
    1. One way to do this is to add it to your ~/.profile file as `export open_weather_key=your_key_here`
    1. If you do add it to your ~/.profile, either shut down your terminal and restart it OR type `source ~/.profile`
1. Clone this repo and cd into it locally
1. run `bundle install`
1. run `rails dev:cache` <- this allows you to store a cache locally
1. run `rails s` to start your server (😉 no db needed)

Once you have everything running you can test it out using curl by running the following in your console: 
```
curl -H "Content-Type: application/json" -X GET localhost:3000/api/v1/reports
```
You should get back a json response that looks something like: 

```
{
  "weather":{
    "description":["clear sky"],
     "temp":{"min":28.4,"max":39.2,"current_tem":33.17}
     },
  "air_quality":{
    "particulates":[{"no2":"safe!"},{"o3":"safe!"}]
  }
}
```

### Endpoints

Currently there is only one endpoint. And it's documented above. If more endpoints are added I'd consider adding some kind of automated documentation but given the size of this application that seems like a bit much.

### Next Steps

1. At the moment, this app only returns data for Baltimore. It'd be more fun if it could take a query param.
1. The air quality api that I'm using has a TON of param options for the types of particulates it measures. It'd be great to add analysis of at least a few more. 
1. Host this some place.
