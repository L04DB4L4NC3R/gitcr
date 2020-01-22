#!/bin/bash

source ./.env

template_name=$GITHUB_TEMPLATE_NAME
template_owner=$GITHUB_TEMPLATE_OWNER
owner_name=$GITHUB_ORGANIZATION_OWNER
token=$GITHUB_PERSONAL_ACCESS_TOKEN

echo "Running..."

while p= read -r line; do
	
	echo "<><><><><><><>"
	echo "Repo: $line"

	# Making the API call and storing the resulting status code
	code=`curl -i -s -XPOST -d "{\"owner\": \"$owner_name\", \"name\": \"$line\"}" https://api.github.com/repos/$template_owner/$template_name/generate -H "Accept: application/vnd.github.baptiste-preview+json" -H "Authorization: token $token" | head -1 | cut -d" " -f2`

	echo Status code: $code

	# Checking if request succeeded
	if [ $code -eq 201 ]
	then
		echo [Success] for repo \"$line\"
		echo URL: https://github.com/$GITHUB_ORGANIZATION_OWNER/$line
	else 
		echo [FAILURE] for repo \"$line\"
	fi

	echo "<><><><><><><>"
	echo "Sleeping for 1.5s"
	sleep 1.5 # For avoiding rate limit of 10 req per min

done < ./repos.txt

