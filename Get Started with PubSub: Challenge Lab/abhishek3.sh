#!/bin/bash
# Define color variables

BLACK=`tput setaf 0`
RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
MAGENTA=`tput setaf 5`
CYAN=`tput setaf 6`
WHITE=`tput setaf 7`

BG_BLACK=`tput setab 0`
BG_RED=`tput setab 1`
BG_GREEN=`tput setab 2`
BG_YELLOW=`tput setab 3`
BG_BLUE=`tput setab 4`
BG_MAGENTA=`tput setab 5`
BG_CYAN=`tput setab 6`
BG_WHITE=`tput setab 7`

BOLD=`tput bold`
RESET=`tput sgr0`

#----------------------------------------------------start--------------------------------------------------#

echo "${BG_BLUE}${WHITE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo "${BG_CYAN}${BOLD}🚀 Welcome to Dr Abhishek Cloud Tutorials 🚀${RESET}"
echo "${BG_BLUE}${WHITE}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

echo "${BG_GREEN}${BOLD}Starting Execution...${RESET}"

export MSG_BODY='Hello World!'

gcloud pubsub topics create cloud-pubsub-topic

gcloud pubsub subscriptions create cloud-pubsub-subscription --topic=cloud-pubsub-topic

gcloud services enable cloudscheduler.googleapis.com

gcloud scheduler jobs create pubsub cron-scheduler-job \
  --location=$LOCATION \
  --schedule="* * * * *" \
  --topic=cloud-pubsub-topic \
  --message-body="Hello World!"

gcloud pubsub subscriptions pull cloud-pubsub-subscription --limit 5

echo "${BG_MAGENTA}${BOLD}🎉 Congratulations For Completing The Lab !!!${RESET}"
echo "${BG_YELLOW}${BLACK}${BOLD}📢 Subscribe to Dr. Abhishek’s Channel for More Labs:${RESET}"
echo "${BLUE}${BOLD}👉 https://www.youtube.com/@drabhishek.5460/videos${RESET}"

#-----------------------------------------------------end----------------------------------------------------------#
