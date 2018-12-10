# Automation

Automation scripts for:
* getting started on a new machine
* AWS set up

I always end up running (And having to figure out) the same commands over and over each time I set up a new machine or website. So now I'm trying to maintain those commands here so I can run a single file and have everything set up.

## Warning
Piping to bash can be dangerous. I wrote these scripts, so I trust them. You may not want to do that.

## Machine Set Up

### Linux
```
wget -O - https://raw.githubusercontent.com/JustinDFuller/setup/master/ubuntu.sh | sudo bash
```

### Mac
```
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/macosx.sh | sudo bash
```

## AWS Set Up

### Static Site

A static site, hosted in S3, served with CloudFront, DNS by Route 53, SSL certificate through ACM, continuous integration with CodeBuild.

You must have the AWS CLI installed.

```
aws cloudformation deploy --stack-name "" --template-file CloudFormation/static-site.json --parameter-overrides "RootDomainName=" "OriginAccessIdentityComment=" "GithubUser=" "GithubRepo="
```
