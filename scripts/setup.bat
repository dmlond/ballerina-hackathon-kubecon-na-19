rem ----- Only set DEMO_HOME if not already set ----------------------------
:checkDemoHome
rem %~sdp0 is expanded pathname of the current script under NT with spaces in the path removed
if "%DEMO_HOME%"=="" set DEMO_HOME=%~sdp0..

rem other k8s artifacts
kubectl apply -f  %DEMO_HOMEE%\kubernetes-manifests\emailservice.yaml
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\frontend.yaml
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\loadgenerator.yaml
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\paymentservice.yaml
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\recommendationservice.yaml
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\redis.yaml
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\shippingservice.yaml

rem Recommendation Service - Reference service in Ballerina
ballerina build --sourceroot %DEMO_HOME%\src\recommendationservice_ballerina\src\recommendationservice --all
kubectl apply -f  %DEMO_HOME%\src\recommendationservice_ballerina\target\kubernetes\recommendationservice


rem Curency Service
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\currencyservice.yaml

rem Replace above with following command when you implemented the currency service in Ballerina.
rem ballerina build --sourceroot %DEMO_HOME%/src/currencyservice_ballerina/src/currencyservice --all
rem kubectl apply -f  %DEMO_HOME%\src\currencyservice_ballerina\target\kubernetes\currencyservice


rem Product Catalog Service
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\productcatalogservice.yaml

rem Replace above with following command when you implemented the product catalog service in Ballerina.
rem ballerina build --sourceroot %DEMO_HOME%/src/productcatalogservice_ballerina/src/productcatalogservice --all
rem kubectl apply -f  %DEMO_HOME%\src\productcatalogservice_ballerina\target\kubernetes\productcatalogservice


rem Cart Service
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\cartservice.yaml

rem Replace above with following command when you implemented the cart service in Ballerina.
rem ballerina build --sourceroot %DEMO_HOME%/src/cartservice_ballerina/src/cartservice --all
rem kubectl apply -f  %DEMO_HOME%\src\cartservice_ballerina\target\kubernetes\cartservice


rem Ad service
kubectl apply -f  %DEMO_HOME%\kubernetes-manifests\adservice.yaml

rem Replace above with following command when you implemented the ad service in Ballerina.
rem ballerina build --sourceroot %DEMO_HOME%/src/adservice_ballerina/src/adservice --all
rem kubectl apply -f  %DEMO_HOME%\src\adservice_ballerina\target\kubernetes\adservice

rem Checkout service
kubectl apply -f  %DEMO_HOME%/kubernetes-manifests\checkoutservice.yaml

rem Replace above with following command when you implemented the checkout service in Ballerina.
rem ballerina build --sourceroot %DEMO_HOME%/src/checkoutservice_ballerina/src/checkoutservice --all
rem kubectl apply -f  %DEMO_HOME%\src\checkoutservice_ballerina\target\kubernetes\checkoutservice

:END