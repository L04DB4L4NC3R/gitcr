
<p align="center">
	<img src="https://user-images.githubusercontent.com/30529572/72942245-f8fee880-3d98-11ea-8821-346c74e55f56.png" height=20% width=30%/>
	<h2 align="center"> GitCR </h2>
	<h4 align="center"> A dead simple script for bulk creation and deletion of GitHub repositories <h4>
</p>

---


## Functionalities
- [X] Bulk create repositories from a template
- [X] Revert creation

## Instructions to run

### Pre-requisites
* A linux based system with *curl* installed, or docker.
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

3. Lastly, to get started run the following commands:
```bash
$ chmod +x gitcr
$ ./gitcr
```

### Execution

```bash
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

<p align="center">
	Made with :heart: by <a href="https://github.com/L04DB4L4NC3R">L04DB4L4NC3R</a>
</p>

