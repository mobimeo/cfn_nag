# cfn-nag version for moovel

This repo builds a version of the [stelligent cfn_nag container](https://github.com/stelligent/cfn_nag) adapted for moovel. It mainly configures ignored linting rules (see `cfn_nag_ignore.yaml`).

# Lint cfn files

Invoke the container to lint cfn files.

`docker run --rm -v "$PWD:/templates" -t moovel/cfn_nag "templates/path/to/templates.yaml"`

Cfn_nag also supports parameter files, so you can call:

```
docker run --rm -v "$PWD:/templates" -t moovel/cfn_nag templates/path/to/templates.yaml \
 --parameter-values-path="/templates/path/to/parameter.json
```

## Bash aliases

A bash alias does not work with parameters, but you can get the same effect with a function. Then execute it with:

```
cfn-nag path/to/template.yaml

cfn-nag-parm path/to/template.yaml path/to/parameter.json
```

Add these lines to your .bashrc:

```
cfn-nag() { docker run --rm -v "$PWD:/templates" -t moovel/cfn_nag "templates/$1";}

cfn-nag-parm() { docker run --rm -v "$PWD:/templates" -t moovel/cfn_nag "templates/$1"\
  --parameter-values-path="/templates/$2";}

```

# Build the container

Build a local version, instead of fetching the container from docker hub.


`docker build -t moovel/cfn_nag:local .`

