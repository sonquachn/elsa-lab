def call() {
  sh """helm upgrade ${JOB_BASE_NAME}-${ENV} helm/${JOB_BASE_NAME} \
  -i -n elsa-${ENV} \
  --set docker_server=${ECR_SERVER} \
  --set image.tag=${currentBuild.displayName} \
  --set hpa.minReplicas=${HPA_MINREPLICAS} \
  --set hpa.maxReplicas=${HPA_MAXREPLICAS}
  """
}
