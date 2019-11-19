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
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/emailservice.yaml
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/frontend.yaml
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/loadgenerator.yaml
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/paymentservice.yaml
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/redis.yaml
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/shippingservice.yaml

# Recommendation service
kubectl delete -f  $DEMO_HOME/src/recommendationservice_ballerina/target/kubernetes/recommendationservice

# Recommendation service - reference gRPC service in Ballerina
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/currencyservice.yaml
# kubectl delete -f  $DEMO_HOME/src/currencyservice_ballerina/target/kubernetes/currencyservice

# Product 
kubectl delete -f  $DEMO_HOME/kubernetes-manifests/productcatalogservice.yaml
#kubectl delete -f  $DEMO_HOME/src/productcatalogservice_ballerina/target/kubernetes/productcatalogservice

kubectl delete -f  $DEMO_HOME/kubernetes-manifests/cartservice.yaml
# kubectl delete -f  $DEMO_HOME/src/cartservice_ballerina/target/kubernetes/cartservice

kubectl delete -f  $DEMO_HOME/kubernetes-manifests/adservice.yaml
# kubectl delete -f  $DEMO_HOME/src/adservice_ballerina/target/kubernetes/adservice

# checkout service.
# kubectl delete -f  $DEMO_HOME/kubernetes-manifests/checkoutservice.yaml
kubectl delete -f  $DEMO_HOME/src/checkoutservice_ballerina/target/kubernetes/checkoutservice
