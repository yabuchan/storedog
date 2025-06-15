#!/bin/bash

prefix="yabuchan905/datadog-storedog-"
suffix=":v1"
images=( "frontend" "backend" "discounts" "ads" "nginx" "postgres" "puppeteer" "puppeteer")

function build {
        for i in "${images[@]}"; do
                im="${prefix}${i}${suffix}";
                docker-compose -f docker-compose-build.yml build $i
        done
}

function push {
	#prefix="yabuchan905/datadog-storedog-"
	#suffix=":v1"
	#images=( "frontend" "backend" "discounts" "ads" "nginx" "postgres" "puppeteer" "puppeteer") 
	
	for i in "${images[@]}"; do 
		im="${prefix}${i}${suffix}";
		docker push $im
	done
}

build &&
push &&
echo "SUCCESSFULLY BUILT and PUSHED"
