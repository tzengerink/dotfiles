#!/bin/bash
#
# Get the weather for a specified WOEID
# See: http://developer.yahoo.com/weather/

WOEID=727232

curl --silent "http://weather.yahooapis.com/forecastrss?u=c&w=$WOEID" | grep "<yweather:condition" | awk -F"\"" '{printf "%s, %d degr.", $2, $4}'
