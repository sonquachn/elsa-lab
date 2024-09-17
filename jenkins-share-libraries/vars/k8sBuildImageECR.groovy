def call(item) {
    tag = "${currentBuild.displayName}"
    // Login private docker
    withCredentials([
      aws(
        credentialsId: "ECR_AWS",
        accessKeyVariable: 'ECR_AWS_ACCESS_KEY_ID',
        secretKeyVariable: 'ECR_AWS_SECRET_ACCESS_KEY'
      )
    ]) {
        sh 'export AWS_ACCESS_KEY_ID=${ECR_AWS_ACCESS_KEY_ID} \
          && export AWS_SECRET_ACCESS_KEY=${ECR_AWS_SECRET_ACCESS_KEY} \
          && aws ecr get-login-password --region ${ECR_REGION}|sudo docker login --username AWS --password-stdin ${ECR_SERVER}'
    }

    if ( "${item}" == "null" ) {
        SERVICE = "${JOB_BASE_NAME}"
    } else {
        SERVICE = "${item}"
    }

    sh """echo Building service: ${SERVICE}"""

    sh """sudo docker-compose build --build-arg REGISTRY_SERVER=${ECR_SERVER} \
        ${SERVICE}"""

    sh """sudo docker tag ${JOB_BASE_NAME}_${SERVICE} \
        ${ECR_SERVER}/${SERVICE}:${tag}"""

    sh """sudo docker image push \
        ${ECR_SERVER}/${SERVICE}:${tag}"""
}
