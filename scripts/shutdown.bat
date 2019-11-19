rem ----- Only set DEMO_HOME if not already set ----------------------------
:checkDemoHome
rem %~sdp0 is expanded pathname of the current script under NT with spaces in the path removed
if "%DEMO_HOME%"=="" set DEMO_HOME=%~sdp0..

rem other k8s artifacts
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\emailservice.yaml
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\frontend.yaml
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\loadgenerator.yaml
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\paymentservice.yaml
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\redis.yaml
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\shippingservice.yaml

rem Recommendation service - reference gRPC service in Ballerina
kubectl delete -f  %DEMO_HOME%\src\recommendationservice_ballerina\target\kubernetes\recommendationservice

rem Currency service
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\currencyservice.yaml
# kubectl delete -f  %DEMO_HOME%\src\currencyservice_ballerina\target\kubernetes\currencyservice

rem Product catelog service.
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\productcatalogservice.yaml
#kubectl delete -f  %DEMO_HOME%\src\productcatalogservice_ballerina\target\kubernetes\productcatalogservice

rem Cart service
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\cartservice.yaml
# kubectl delete -f  %DEMO_HOME%\src\cartservice_ballerina\target\kubernetes\cartservice

rem Ad service
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\adservice.yaml
# kubectl delete -f  %DEMO_HOME%\src\adservice_ballerina\target\kubernetes\adservice

rem checkout service.
kubectl delete -f  %DEMO_HOME%\kubernetes-manifests\checkoutservice.yaml
# kubectl delete -f  %DEMO_HOME%\src\checkoutservice_ballerina\target\kubernetes\checkoutservice_ballerina
