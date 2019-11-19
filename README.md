# Ballerina hackathon - KubeCon North America 2019

Ballerina hackathon is an open invitation to all the KubeCon NA 2019 attendees to use their Ballerina skills with Kubernetes to complete a series of coding challenges and win amazing prizes. 

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

- Venue: KubeCon NA 2019

- Start: Nov 19, 2019 10.00AM

- End: Nov 21, 2019 12.00PM

- Winners will be announced by Nov 21, 209 3.00 PM

## Challenges
The challenges are based on the [Hipster Shop: Cloud-Native Microservices Demo Application](https://github.com/GoogleCloudPlatform/microservices-demo) developed by Google Cloud. It is a web-based e-commerce application with 10 microservices written in different programming languages that talk to each other over gRPC. You can refer to the original [README.md](https://github.com/GoogleCloudPlatform/microservices-demo/blob/master/README.md) file to learn more about this application. Here is a brief overview of the service architecture.

[![Architecture of microservices](./docs/img/architecture-diagram.png)](./docs/img/architecture-diagram.png)

In this hackathon, your task is to implement the following microservices in Ballerina. We calculated the level of difficulty based on the Ballerina knowledge required as well as the LOC. 

| Service                                              | Level of Difficulty |Language      | Description                                                                                                                       |
| ---------------------------------------------------- | ------------------- |------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| [currencyservice](./src/currencyservice)             | Easy                | Node.js       | Converts one money amount to another currency. Uses real values fetched from European Central Bank. It's the highest QPS service. |
| [productcatalogservice](./src/productcatalogservice) | Easy                | Go            | Provides the list of products from a JSON file and ability to search products and get individual products.|
| [adservice](./src/adservice)                         | Easy                | Java          | Provides text ads based on given context words.|
| [cartservice](./src/cartservice)                     | Eedium              | C#            | Stores the items in the user's cart and retrieves it.|
| [checkoutservice](./src/checkoutservice)             | Hard                | C#            | Retrieves user cart, prepares order and orchestrates the payment, shipping and the email notification.|

### Implementation Instructions
We expect you to go through the instructions for each service before implementing the logic. You can refer to the original source code for more information.

| Service                                              | Instructions                                                                                                                       |
| ---------------------------------------------------- | --------------------------------------------------------------------------- |
| [currencyservice](./src/currencyservice)             | <ol><li>Read the conversion data in /src/currencyservice/data/currency_conversion.json (you can copy it to your ballerina project)</li><li>Then implement the logic to output the correct conversion based on the ratios in JSON data.</li><li>The `GetSupportedCurrencies` and `Convert` resources have to be implemented.</li></ol> |
| [productcatalogservice](./src/productcatalogservice) | <ol><li>Read the product.json using IO operations. Convert the JSON[] in to Product record[].</li><li>Then implement  ‘ListProducts’, ‘GetProduct’, and ‘SearchProducts’ resources.</li></ol> |
| [adservice](./src/adservice)                         | <ol><li>Implement service to generate ads based on given context keys.</li></ol> |
| [cartservice](./src/cartservice)                     | <ol><li>Implement the logic to update the user’s cart (add/remove) items or retrieve the cart.</li><li> Instead of the Redis store in the original implementation, you can use a `map<Cart>` as an in-memory store for the Ballerina implementation.</li></ol> |
| [checkoutservice](./src/checkoutservice)             | <ol><li>This microservice is a service chaining example where you need to integrate with services, including payment, email, shipping, currency, cart, and product catalog services.</ol> |
                                                                                                                
Read the product.json using IO operations. Convert the JSON[] in to Product record[].
Then implement  ‘ListProducts’, ‘GetProduct’, and ‘SearchProducts’ resources.

## Prizes
There are 5 challenges in this Ballerina hackathon. You need to complete all 5 challenges to be eligible for a prize.

- First Prize -  [Bose Quiet Comfort 35 wireless headphones II
  Star Wars: The Rise of Skywalker Edition](https://www.bose.com/en_us/products/headphones/over_ear_headphones/quietcomfort-35-wireless-ii-skywalker.html)

- Second Prize - [Echo Studio](https://www.amazon.com/Echo-Studio/dp/B07G9Y3ZMC)

- The next best 10 submissions will receive $50 worth Amazon vouchers. 



**[TODO]** Document eligibility criteria 



## Getting started
### Prerequisites
#### Ballerina 
- Visit https://ballerina.io/downloads/ to install the latest ballerina version 1.0.4 as well as the VSCode or IntelliJ IDEA plugins. 

#### IDE Plugins

##### VSCode
- Download the latest VSCode plugin here: https://ballerina.io/learn/tools-ides/vscode-plugin/

##### IDEA
- Download the latest IntelliJ IDEA plugin here: https://ballerina.io/learn/tools-ides/intellij-plugin/

#### Docker and Kubernetes 
- Use [Docker for Mac](https://docs.docker.com/docker-for-mac/install/) to install on Mac.
- Use [Docker for Windows](https://docs.docker.com/docker-for-windows/) to install on Windows.
- Install [Docker CE](https://docs.docker.com/v17.12/install/#server) and [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/) on Linux.

**Note**: Execute `eval $(minikube docker-env)` after installing Minikube so 
that the Docker client points to Minikube’s docker registry.

### GitHub Repository

1. Create a private GitHub repository in your account. Do not fork this repository if you want to keep your code 
private during the hackathon. An example repository name would be `ballerina-hackathon-kubecon-na-19`.

2. Run the following commands to merge the microservices-demo content to your newly created repository.
    ```bash
    $ git clone https://github.com/<gitbubusername>/ballerina-hackathon-kubecon-na-19

    $ cd ballerina-hackathon-kubecon-na-19

    $ git remote add upstream https://github.com/ballerina-guides/microservices-demo.git

    $ git pull upstream master

    $ git push origin master
    ```

### Running Hipster Shop Application (unchanged)
1. Clone this repository, and go to the repository directory.
2. Run `kubectl apply -f ./release/kubernetes-manifests.yaml` to deploy the app.
3. Run `kubectl get pods` to see whether pods are in a Ready state. 
4. If all the pods are running, `kubectl get service/frontend-external`
5. Find the IP address of your application, then visit the application on your browser to confirm installation. 
(http://localhost:80)
    ```sh
    kubectl get service/frontend-external
    ```
    Note: If you are on Minikube, get the hostname by executing `minikube ip`. e.g., <MINIKUBE_IP>:<FRONTEND_EXTERNAL_PORT>

    Congrats, you have successfully installed the default application by now.
    
6. Run `kubectl delete -f ./release/kubernetes-manifests.yaml` to delete what's deployed.

### Running the Hipster Shop Application with Ballerina Services
To help you get started, we’ve already implemented the recommendation service in Ballerina, and the source code is available in the `src/recommendatationservice_ballerina` directory.

1. Go to the repository directory and run the setup script:
   ```sh
   sh scripts/setup.sh
   ```

2. Check pods with `kubectl get pods`

3. Access the web UI (http://localhost:80 or `http://<MINIKUBE_IP>:<FRONTEND_EXTERNAL_PORT>`)

4. Run the `scripts/shutdown.sh` script to delete what's deployed.

Now that you’ve successfully installed and deployed the Hipster Shop application with one microservice written in Ballerina, it’s time to start working on the challenges. 

The microservices in this application talk to each other over gRPC. I.e, the microservices that you are implementing will receive requests over gRPC and they will also integrate with other microservices over gRPC. You can find the protocol buffers description [here](./pb/demo.proto).

The first step would be to generate Ballerina gRPC service skeletons and client stubs. You can follow the following guides to learn more about gRPC support in Ballerina. 

- https://ballerina.io/learn/how-to-generate-code-for-protocol-buffers/ 
- https://github.com/ballerina-guides/grpc-service
- https://ballerina.io/learn/by-example/grpc-unary-blocking.html

### Generating Ballerina source code for gRPC protocol buffers
Go to  your repository directory and run the following command to generate Services from proto file.
```sh
ballerina grpc --input pb/demo.proto  --output stubs --mode service
```
Now the “stubs” directory will have the generated Ballerina services and client artifacts as below.

Services skeletons
- AdService_sample_service.bal
- CheckoutService_sample_service.bal                
- PaymentService_sample_service.bal
- RecommendationService_sample_service.bal    
- ProductCatalogService_sample_service.bal     
- CurrencyService_sample_service.bal
- CartService_sample_service.bal   
- EmailService_sample_service.bal   
- ShippingService_sample_service.bal

Client stubs
- demo_pb.bal

Note: You can copy the relevant service skeleton file and the demo_pb.bal file to your project.
 
Let’s start by writing the [recommendationservice](./src/recommendationservice) in Ballerina. We’ve already implemented this service for your reference. Here are the steps that we followed. You can repeat the same for all 3 challenges.  

### Let's start with the Recommendation Service
In Ballerina, the code is structured using projects and modules. A module is a directory which provides collaboration, sharing, and reuse of Ballerina code. Projects can have multiple related modules.
Please find more information [here](https://ballerina.io/learn/how-to-structure-ballerina-code/).

In this demo, our recommendation is to create a Ballerina project for each microservice. Let’s append “_ballerina” to the name of the microservices that you are working on. 
 
1. Go to the src directory and run the following command to create a new project.
    ```bash
    $ cd src
    $ ballerina new recommendationservice_ballerina
    ```
    
2. Change the directory to the project directory you just created.
    ```bash
    $ cd recommendationservice_ballerina
    ```

3. Add a new Ballerina module. This is where we maintain the code that belongs to the recommendationservice. 
    ```bash
    $ ballerina add recommendationservice
    ```
    
    **Note**: You can delete the unnecessary generated files such as the main.bal file and the tests and resources 
    directories inside the module directory.
    
4. Copy the corresponding service template source file and the demo_pb.bal file to the module directory.
    ```bash
    cp ../../stubs/demo_pb.bal src/recommendationservice/
    cp ../../stubs/RecommendationService_sample_service.bal src/recommendationservice/
    ```

    Note: The demo_pb.bal file needs to copied to each project which contains clients and common constructs. 
    
5. Now that you have some Ballerina code try compiling the code with the `ballerina build -a` command. This command 
builds all the modules in your project. If the build is successful, you can find an executable JAR file in the 
project's `target/bin` directory.

6. Refer the original instructions of each service defined in the [Challenges section](#Challenges), and rewrite the 
logic in ballerina. Refer to the original source code to get an understanding of the business logic. 

7. Checkout the diagram view for the service you implement.

    You can follow the plugin specific instructions to view the diagram.
    - [VSCode](https://ballerina.io/learn/tools-ides/vscode-plugin/graphical-editor)
    - [IDEA](https://ballerina.io/learn/tools-ides/intellij-plugin/using-intellij-plugin-features#viewing-the-sequence-diagram)
    
    [TODO] add image

8. Introduce `@kubernetes:Service` and `@kubernetes:Deployment` annotations to integrate generating the k8s artifacts during the build (Refer the recommendation service for examples). Make sure to use correct service name.

    You can refer the following resources for detailed explanations on using the annotations:
    - [Kubernetes Deployment Ballerina by Example](https://ballerina.io/learn/by-example/kubernetes-deployment.html)
    - [The Kubernetes-Based Deployment section of How to Run and Deploy Ballerina Programs](https://ballerina.io/learn/how-to-deploy-and-run-ballerina-programs/)
    
    e.g.,
    ```ballerina
    @kubernetes:Service {
        serviceType: "ClusterIP",
        name: "recommendationservice"
    }
    ```

    **Note**: A k8s deployment will be created by default, but if you need to change 
    the k8s deployment, you can introduce the `@kubernetes:Deployment` annotation with the relevant configuration.
    
    Additionally, if you are using Minikube you would have to introduce the 
    following deployment config.
    ```ballerina
    @kubernetes:Deployment {
        dockerHost: "tcp://<docker_ip>:<docker_port>", 
        dockerCertPath: ".minikube/certs"
    }
    ```

    You can still skip the above when using Minikube by executing `eval $(minikube docker-env)`.
     
9. Build and generate the k8s artifacts, to ensure there are no errors.
    
    ```bash
    ballerina build recommendationservice_ballerina
    ```

10. Once you’ve completed a service, update the start.sh file to use the Ballerina implementation of that service. You can replace the current command for the particular service with the Ballerina commands for them instead.

    e.g.,
    ```cmd
    kubectl apply -f  $DEMO_HOME/kubernetes-manifests/recommendationservice.yaml
    
    # ballerina build --sourceroot $DEMO_HOME/src/recommendationservice_ballerina/src/recommendationservice --all
    # kubectl apply -f  $DEMO_HOME/src/recommendationservice_ballerina/target/kubernetes/recommendationservice
    ```

    Here, comment out the first line and uncomment the second and third lines to use the Ballerina build and generated artifacts for the  service.

11. Repeat step 10 for the stop.sh file.

12. Run the modified setup script and check the status of the pods.
    ```bash
    kubectl get pods
    ```

13. Tail the logs of your services.
    ```bash
    kubectl logs -f <pod-name>
    ```

14. Access the web UI (http://localhost:80 or http://<MINIKUBE_IP>:<FRONTEND_EXTERNAL_PORT>)

15. Use the stop script to clean the deployments.

16. Then move on to the next challenge and repeat steps 1 - 15.

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
