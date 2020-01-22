# Make env variables out of .env
. ./.env

template_name=$GITHUB_TEMPLATE_NAME
template_owner=$GITHUB_TEMPLATE_OWNER
owner_name=$GITHUB_ORGANIZATION_OWNER
token=$GITHUB_PERSONAL_ACCESS_TOKEN
GITHUB_MAX_REQUESTS=5000
