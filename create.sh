#!/bin/bash

source ./.env

template_name=$GITHUB_TEMPLATE_NAME
template_owner=$GITHUB_TEMPLATE_OWNER
owner_name=$GITHUB_ORGANIZATION_OWNER
token=$GITHUB_PERSONAL_ACCESS_TOKEN

create(){
	echo "Executing \"create\""
	CREATION_STATUS=""

	count=1
	cur=1
	result=("[")
	while p= read -r line; do
		
		echo "Repo: $line"

		# Making the API call and storing the resulting status code
		res=`curl -i -s -XPOST -d "{\"owner\": \"$owner_name\", \"name\": \"$line\"}" https://api.github.com/repos/$template_owner/$template_name/generate -H "Accept: application/vnd.github.baptiste-preview+json" -H "Authorization: token $token" | head -1`

		code=`echo $res | cut -d" " -f2`
		status_of_request=`echo $res | cut -d" " -f3-5`

		echo Status code: $code

		# Checking if request succeeded
		if [[ $code -eq 201 ]]
		then
			echo [Success] for repo \"$line\"
			echo URL: https://github.com/$GITHUB_ORGANIZATION_OWNER/$line
			CREATION_STATUS=SUCCESS
			url="https://github.com/$GITHUB_ORGANIZATION_OWNER/$line"
		else 
			CREATION_STATUS=FAILURE
			echo [FAILURE] for repo \"$line\"
		fi
		# TODO: avoiding rate limit of 10 req per min
		
		result[$count]=`echo { \"repo_name\": \"$line\", \"status\": \"$CREATION_STATUS\", \"order_of_execution\": $cur, \"code\": $code, \"url\": \"$url\" } | jq`

		let "count++"
		let "cur++"
		result[$count]=","
		let "count++"

		url=""

	done < ./repos.txt

	result[$count]="]"
	let "count=count-1"
	result[$count]=""

	echo $2
	if [[ $2 == "--out=json"  ]]
	then
		echo ${result[@]} > out.json
	else
		echo ${result[@]}
	fi

	echo Total count: $cur

}

create $@
