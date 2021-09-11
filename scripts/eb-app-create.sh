#!/bin/bash

echo "EB app and environment creation begins ...!!"

echo "Begin:: with sanity check"

if [ -z $1 ]; then
  echo "Error: app name missing. Please specify valid app name and re-initiate the process."
fi
if [ -z $2 ]; then
  echo "Error: Env name missing. Please specify the env name and re-initiate the process."
fi
if [ -z $3 ]; then
  echo "Error: 'Shared load balancer' name missing. Please specify the shared load balancer and re-initiate the process."
  echo "Done:: with sanity check"
  exit
fi

echo "I am inside directory = "$(pwd)
echo "Begin:: with app initialization"
cd ../apps/learn-and-share-$1-$2
eb init --platform "Docker running on 64bit Amazon Linux 2" --region ap-south-1
echo "Done:: with EB app initialization."

echo "Begin:: For environment existance check"
env_list=$(eb list)
does_env_exists=$(grep -q $2 <<< $env_list && echo "true" || echo "false")
if [ $does_env_exists == true ]; then
  echo "Env found. Duplicate env creation for the same app not allowed.";
  exit 1;
fi
echo "Done:: with environment existance check. No env found. Proceeding with env creation steps."

echo "Begin:: with env creation"
eb create $1-$2 --cfg $1-$2 --elb-type application --shared-lb $3
echo "Done:: with env creation"

echo "EB app creation completed ...!!"