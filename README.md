# Ballerina Hackathon - KubeCon + CloudNativeCon North America 2019

This hackathon is an open invitation to all KubeCon NA 2019 attendees to try out Ballerina with Kubernetes, 
complete a series of coding challenges, and win some amazing prizes.

- [Overview](#Overview)
- [Challenges](#Challenges)
- [Prizes](#Prizes)
- [Getting started](#Getting-started)
- [Submission guidelines](#Submission-guidelines) 
- [Judging](#Judging)
- [Rules](#Rules)
- [FAQ](#FAQ)
- [Hackathon policies](#Hackathon-policies)

## Overview
These coding challenges are all about having fun, learning a new programming language, mashing up microservices, and deploying them on Kubernetes. Here are some essential details about this hackathon. 

- Venue: [KubeCon + CloudNativeCon North America 2019](https://events19.linuxfoundation.org/events/kubecon-cloudnativecon-north-america-2019/)

- Start: Nov 19, 2019 at 10:00 a.m.

- Submission deadline: Nov 21, 2019 12:00 p.m.

- Winners will be announced at 3:00 p.m. on Nov 21 at the Ballerina booth

## Challenges

The challenges are based on the “[Hipster Shop: Cloud-Native Microservices Demo Application](https://github.com/GoogleCloudPlatform/microservices-demo)” 
developed by Google Cloud. It is a web-based e-commerce application with 10 microservices written in different programming languages that 
talk to each other over gRPC. You can refer to the original [README.md](https://github.com/GoogleCloudPlatform/microservices-demo/blob/master/README.md) file 
to learn more about this application. Here is a brief overview of the service architecture.

[![Architecture of microservices](./docs/img/architecture-diagram.png)](./docs/img/architecture-diagram.png)

All you have to do is implement the following microservices in Ballerina. Order of services indicate how much Ballerina 
knowledge you will need to implement it as the first service require very little knowledge of Ballerina as well as the 
lines of code. We recommend you to complete the challenges in the order they appear in the below table to make the 
learning process easy.

| Microservice  | Original Language | Description |
| ------------- | ------------- | ------------- |
| [adservice](https://github.com/ballerina-guides/microservices-demo/blob/master/src/adservice)  | Java | Provides text ads based on given context words |
| [currencyservice](https://github.com/ballerina-guides/microservices-demo/blob/master/src/currencyservice)  | NodeJS  | Converts a certain amount in one currency to another currency. |
| [checkoutservice](https://github.com/ballerina-guides/microservices-demo/blob/master/src/checkoutservice)  | Go  | Retrieves the user cart, prepares the order and orchestrates the payment, shipping and the email notification. |


### Hear's What you need to do

Take a look at the steps for each service below to understand how you need to implement the logic. Check out the original 
source code for more information.

| Microservice  | Instructions |
| ------------- | ------------- |
| [adservice](https://github.com/ballerina-guides/microservices-demo/blob/master/src/adservice)  | <ol><li>Implement a service to generate ads based on given context keys.</li></ol>  |
| [currencyservice](https://github.com/ballerina-guides/microservices-demo/blob/master/src/currencyservice)  | <ol><li>Read the conversion data in /src/currencyservice/data/currency_conversion.json (you can copy it to your ballerina project)</li><li>Then implement the logic to output the correct conversion</li><li>based on the ratios in JSON data. The `GetSupportedCurrencies` and `Convert` resources have to be implemented.</li></ol>|
| [checkoutservice](https://github.com/ballerina-guides/microservices-demo/blob/master/src/checkoutservice)  | <ol><li>Implement a service to generate ads based on given context keys.</li><li>Refer https://github.com/GoogleCloudPlatform/microservices-demo/blob/master/docs/img/architecture-diagram.png</li></ol>  |

The [Getting Started](#Getting-started) section has more details on how to complete these challenges

## Prizes
There are 5 challenges in this Ballerina hackathon. You need to complete all 5 challenges to be eligible for a prize.

- First Prize -  [Bose Quiet Comfort 35 wireless headphones II
  Star Wars: The Rise of Skywalker Edition](https://www.bose.com/en_us/products/headphones/over_ear_headphones/quietcomfort-35-wireless-ii-skywalker.html)

- Second Prize - [Echo Studio](https://www.amazon.com/Echo-Studio/dp/B07G9Y3ZMC)

- The next best 10 submissions will receive $50 worth Amazon vouchers. 



**[TODO]** Document eligibility criteria 



## Getting started

Start with a GitHub Repository in your account. You can clone this repository to your workstation and then push it to your repository. If you directly fork this repository, you won't be able to make it private. It is up to you to keep this repo as a private repo during the hackathon. 

## GitHub repository

1.  Create a private GitHub repository in your personal account. Do not folk this repository if you want to keep your code private during the hackathon. An example repository name would be "ballerina-hackathon-kubecon-na-19"

2. Clone this repository to your machine and then push it your private Git repository.

## Installation

Make sure that you've Docker and Kubernetes installed locally. We recommend you to use the pre-built container images of all the microservices that are available publicly, instead of building yourself. 

### Building and running this application

**[TODO]**

For each microservice you write in Ballerina, you can follow the following steps.

- Create a Ballerina project in the src/ directory.

    `ballerina new recommendationservice_ballerina`

- Move into the directory created for the project

    `cd recommendationservice_ballerina`

- Add a new Ballerina module

    `ballerina add recommendationservice`

- Remove the default content added. Generate the client/service stub and optionally a service/client template using 
the relevant .proto file

    `ballerina grpc --input <project_root>/pb/services/recommendationservice.proto --output src/recommendationservice --mode service`

    Ensure you specify the output path to point to the module created. 

- Once you’ve completed a service, update the setup.sh file, to use the Ballerina implementation of your service. You 
can replace the current command for the particular service with the ballerina commands for them instead.

## Submission guidelines

Once you complete all 5 challenges, you can submit the source code and other details via the following mechanism. 

- Document everything that we need to be aware of your solution in the root README.md file of your repository. 
- Download a zip file of your GitHub repository using the GitHub web interface. 
- Then follow the instructions given in this Google form. **[TODO]**


## Judging
A panel of judges will review each successful submission based on the following criteria. 

**[TODO]**

## Rules
- You have to be a KubeCon North America 2019 attendee to participate in this hackathon.
- **[TODO]**



## FAQ
1. How do I get help with queries related to the hackathon?

    If you have general questions on Ballerina, ask them on our Slack channel, Google group, or on Stackoverflow with the tag [ballerina]. If you have specific questions related to the hackathon, please visit the Ballerina booth(P13).

2. Is this an individual challenge, or can I form a team for this?

    [TODO]
3. Who can participate in the hackathon?

    You have to be a KubeCon North America 2019 attendee to participate in this hackathon.

4. **[TODO]**



## Hackathon policies?

**[TODO]**
