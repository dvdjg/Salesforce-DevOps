# Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

## How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)


## Structure creation

git checkout main; git checkout -b pro; git push --set-upstream origin pro
git checkout main; git checkout -b pre; git push --set-upstream origin pre
git checkout main; git checkout -b uat; git push --set-upstream origin uat
git checkout main; git checkout -b int; git push --set-upstream origin int
git checkout main; git checkout -b dev; git push --set-upstream origin dev


# Crypt the server.key

openssl enc -aes-256-cbc -k <passphrase here> -P -md sha1 -nosalt

# Build the docker image (use version as apropriate, ie. 0.2)

$ docker build --pull --rm -f "docker\Dockerfile" -t sfdxci:0.2 "docker"

$ docker push eldeibiz/sfdxci:0.2


# Habilita pipelines en Bitbucket para tener también variables de entorno.


# Computa el package del diff entre el commit actual y el del troncal 

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD) 
PARENT_BRANCH=$(git show-branch | grep '\*' | grep -v "$CURRENT_BRANCH" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//')
PARENT_TRUNK=$(git show-branch | grep '\*' | grep -v "/" | head -n1 | sed 's/.*\[\(.*\)\].*/\1/' | sed 's/[\^~].*//')
COMMIT_ANCESTOR=$(git merge-base --octopus HEAD $PARENT_BRANCH)
echo "CURRENT_BRANCH=$CURRENT_BRANCH  -  PARENT_BRANCH=$PARENT_BRANCH  -  PARENT_TRUNK=$PARENT_TRUNK  -  COMMIT_ANCESTOR=$COMMIT_ANCESTOR"
mkdir -p delta; sgd --to HEAD --from $COMMIT_ANCESTOR --repo . --output ./delta
cat delta/package/package.xml



git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit -n 50 --all

## Bitbucket Pipelines - Mayo 2020
https://youtu.be/hPTpN4CVQt0?t=1403

## References

- https://blog.enree.co/2019/06/setting-up-sfdx-continuous-integration-using-bitbucket-pipelines-with-docker-image.html


- sfdx-gitlab-org: https://github.com/forcedotcom/sfdx-gitlab-org
