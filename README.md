
<p align="center">
	<img src="https://user-images.githubusercontent.com/30529572/72942245-f8fee880-3d98-11ea-8821-346c74e55f56.png" height=20% width=30%/>
	<h2 align="center"> GitCR </h2>
	<h4 align="center"> A dead simple script for bulk creation and deletion of GitHub repositories <h4>
</p>

---

Check out the blog related to this project: [7 things I learnt from a script for repository creation](https://dev.to/l04db4l4nc3r/7-things-i-learnt-from-a-script-for-repository-creation-4cbk).

## Functionalities
- [X] Bulk create repositories from a template
- [X] Revert creation

## Instructions to run

### Pre-requisites
* Docker, or a linux based system with *curl* and *jq* installed.
* [Github personal access token](https://github.com/settings/tokens) with write and delete permissions. 
* A [template repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template).


### Setup

You'll need 2 things to get started:

1. A file called `.env` with the following variables. See the  [sample](./.env.sample).

2. The second thing that is needed is a `repos.txt` file with the name of the repositories that you want to create. The number of repositories can be anywhere between 1 to 5000, due to the [rate limitation](https://developer.github.com/v3/#rate-limiting) of the GitHub API. eg:
```
repo-1
repo-2
repo-3
...
repo-5000
```
See a sample [here](./repos.txt)


### Execution
To run the scripts on any platform, replace `{PATH}`  with the absolute file path of where your script exists, then run the command(s) below:
```
# For creation
docker run --rm --mount type=bind,source="{PATH}",target=/usr/app/cli/ angadsharma1016/gitcr -c "bash /usr/app/cli/gitcr create"

# For deletion/reverting creation
docker run --rm --mount type=bind,source="{PATH}",target=/usr/app/cli/ angadsharma1016/gitcr -c "bash /usr/app/cli/gitcr revert"

# For creation and piping JSON output to a file
docker run --rm --mount type=bind,source="{PATH}",target=/usr/app/cli/ angadsharma1016/gitcr -c "bash /usr/app/cli/gitcr create --out=json"

# For deletion/reverting and piping JSON output to a file
docker run --rm --mount type=bind,source="{PATH}",target=/usr/app/cli/ angadsharma1016/gitcr -c "bash /usr/app/cli/gitcr revert --out=json"
```

To run the scripts natively (in linux based systems): 

```bash
# One time execution needed for the 2 commands below
$ chmod +x gitcr
$ ./gitcr

# Once done, the following commands can be executed:

# To create bulk repositories
$ ./gitcr create

# To create bulk repositories and pipe output JSON to a file
$ ./gitcr create --out=json

# To revert/delete the created repositories
$ ./gitcr revert

# To revert/delete the created repositories and pipe output JSON to a file
$ ./gitcr revert --out=json
```


<br>


<br>

### Output files
If you have used a `--out=json` flag then a file will be created in the *output/* directory. See the samples for [creation](./output/sample.created_out.json) and [deletion](sample.deleted_out.json) , or see one below:

```json
[
  {
    "repo_name": "generated-01",
    "status": "SUCCESS",
    "order_of_execution": 0,
    "code": 201,
    "url": "https://github.com/L04DB4L4NC3R/generated-01"
  },
  {
    "repo_name": "generated-02",
    "status": "SUCCESS",
    "order_of_execution": 1,
    "code": 201,
    "url": "https://github.com/L04DB4L4NC3R/generated-02"
  }
]
```

And for deletion:

```bash
[
  {
    "repo_name": "generated-01",
    "status": "FAILURE",
    "order_of_execution": 0,
    "code": 404
  },
  {
    "repo_name": "generated-02",
    "status": "FAILURE",
    "order_of_execution": 1,
    "code": 404
  }
]

```

<br>
<br>
<p align="center">
	Made with :heart: by <a href="https://github.com/L04DB4L4NC3R">L04DB4L4NC3R</a>
</p>

