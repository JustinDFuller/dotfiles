<img src="https://repository-images.githubusercontent.com/142769624/e8c127a4-7f3c-43dc-898e-150969a2ea24" />

Automation scripts for:
* getting started on a new machine
* AWS set up

I always end up running (And having to figure out) the same commands over and over each time I set up a new machine or website. So now I'm trying to maintain those commands here so I can run a single file and have everything set up.

## Warning
Piping to bash can be dangerous. I wrote these scripts, so I trust them. You may not want to do that.

## Machine Set Up

### Linux
```
wget -O - https://raw.githubusercontent.com/JustinDFuller/setup/master/ubuntu.sh | bash
```

### Mac
```
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/macosx.sh | bash
```

### Chromebook
```
curl https://raw.githubusercontent.com/JustinDFuller/setup/master/chromebook.sh | bash
```

## AWS Set Up

### Static Site

A static site, hosted in S3, served with CloudFront, DNS by Route 53, SSL certificate through ACM, continuous integration with CodeBuild.

You must have the AWS CLI installed and configured with `aws configure`.

```
aws cloudformation update-stack --stack-name "" --template-body file://CloudFormation/static-site.yaml --parameters "ParameterKey=RootDomainName,ParameterValue=" "ParameterKey=OriginAccessIdentityComment,ParameterValue=" "ParameterKey=GithubUser,ParameterValue=" "ParameterKey=GithubRepo,ParameterValue=" --capabilities "CAPABILITY_IAM"
```
