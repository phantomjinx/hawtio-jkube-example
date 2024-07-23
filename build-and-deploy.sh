oc whoami

if [ $? -ne 0  ]
then
  echo "Could not get the current user from Openshift. Please log in first"
  exit 1  
fi

HAWTIO_CR=$(oc get hawtio -o name)

if [[ "x" == "x$HAWTIO_CR" ]] 
then
  echo "No HawtIO deployment found in this namespace (oc get hawtio -o name)"
  exit 2  
fi

cd camel-sb-4
mvn clean -DskipTests oc:deploy -Popenshift
cd ..
