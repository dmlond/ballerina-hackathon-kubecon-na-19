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

# ballerina service k8s artifacts
ballerina build --sourceroot $DEMO_HOME/src/recommendationservice_ballerina/src/recommendationservice --all
kubectl apply -f  $DEMO_HOME/src/recommendationservice_ballerina/target/kubernetes/recommendationservice

# challenges
kubectl apply -f  $DEMO_HOME/kubernetes-manifests/currencyservice.yaml
# ballerina build --sourceroot $DEMO_HOME/src/currencyservice_ballerina/src/recommendationservice --all
# kubectl apply -f  $DEMO_HOME/src/currencyservice_ballerina/target/kubernetes/currencyservice_ballerina

kubectl apply -f  $DEMO_HOME/kubernetes-manifests/productcatalogservice.yaml
# ballerina build --sourceroot $DEMO_HOME/src/productcatalogservice_ballerina/src/recommendationservice --all
#kubectl apply -f  $DEMO_HOME/src/productcatalogservice_ballerina/target/kubernetes/productcatalogservice_ballerina

kubectl apply -f  $DEMO_HOME/kubernetes-manifests/cartservice.yaml
# ballerina build --sourceroot $DEMO_HOME/src/cartservice_ballerina/src/recommendationservice --all
# kubectl apply -f  $DEMO_HOME/src/cartservice_ballerina/target/kubernetes/cartservice_ballerina

kubectl apply -f  $DEMO_HOME/kubernetes-manifests/adservice.yaml
# ballerina build --sourceroot $DEMO_HOME/src/adservice_ballerina/src/recommendationservice --all
# kubectl apply -f  $DEMO_HOME/src/adservice_ballerina/target/kubernetes/adservice_ballerina

kubectl apply -f  $DEMO_HOME/kubernetes-manifests/checkoutservice.yaml
# ballerina build --sourceroot $DEMO_HOME/src/checkoutservice_ballerina/src/recommendationservice --all
# kubectl apply -f  $DEMO_HOME/src/checkoutservice_ballerina/target/kubernetes/checkoutservice_ballerina
