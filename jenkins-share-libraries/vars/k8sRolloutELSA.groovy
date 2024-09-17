def call() {
    sh """kubectl -n elsa-${ENV} \
        rollout status deployment \
        ${JOB_BASE_NAME}-${ENV}"""
}
