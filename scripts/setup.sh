# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

# Get standard environment variables
PRGDIR=`dirname "$PRG"`

# Only set DEMO_HOME if not already set
[ -z "$DEMO_HOME" ] && DEMO_HOME=`cd "$PRGDIR/.." ; pwd`

# other k8s artifacts
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/emailservice.yaml
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/frontend.yaml
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/loadgenerator.yaml
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/paymentservice.yaml
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/recommendationservice.yaml
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/redis.yaml
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/shippingservice.yaml

# Recommendation Service - Reference service in Ballerina
ballerina build --sourceroot $DEMO_HOME/src/recommendationservice_ballerina/src/recommendationservice --all
kubectl apply -f  $DEMO_HOME/src/recommendationservice_ballerina/target/kubernetes/recommendationservice

# Currency Service
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/currencyservice.yaml

# Replace above with following command when you implemented the currency service in Ballerina.
# ballerina build --sourceroot $DEMO_HOME/src/currencyservice_ballerina/src/currencyservice --all
# kubectl apply -f  $DEMO_HOME/src/currencyservice_ballerina/target/kubernetes/currencyservice


# Product Catalog Service
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/productcatalogservice.yaml

# Replace above with following command when you implemented the product catalog service in Ballerina.
# ballerina build --sourceroot $DEMO_HOME/src/productcatalogservice_ballerina/src/productcatalogservice --all
# kubectl apply -f  $DEMO_HOME/src/productcatalogservice_ballerina/target/kubernetes/productcatalogservice


# Cart service
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/cartservice.yaml

# Replace above command with following command when you implemented the cart service in Ballerina.
# ballerina build --sourceroot $DEMO_HOME/src/cartservice_ballerina/src/cartservice --all
# kubectl apply -f  $DEMO_HOME/src/cartservice_ballerina/target/kubernetes/cartservice


# Ad service
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/adservice.yaml

# Replace above command with following command when you implemented the ad service in Ballerina.
# ballerina build --sourceroot $DEMO_HOME/src/adservice_ballerina/src/adservice --all
# kubectl apply -f  $DEMO_HOME/src/adservice_ballerina/target/kubernetes/adservice


# Checkout service
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/checkoutservice.yaml

# Replace above with following command when you implemented the checkout service in Ballerina.
# ballerina build --sourceroot $DEMO_HOME/src/checkoutservice_ballerina/src/checkoutservice --all
# kubectl apply -f  $DEMO_HOME/src/checkoutservice_ballerina/target/kubernetes/checkoutservice
