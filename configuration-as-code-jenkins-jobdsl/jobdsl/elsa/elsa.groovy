pipelineJob('elsa') {
  properties {
    disableConcurrentBuilds()
  }
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url ('git@bitbucket.org:elsa/hackathon-starter.git')
            credentials('jenkins-bitbucket-ssh')
          }
          branch('*/master')
        }
      }
      lightweight()
      scriptPath("Jenkinsfile")
    }
  }
  
  configure {
		it / 'properties' / 'jenkins.model.BuildDiscarderProperty' {
			strategy {
				'daysToKeep'('-1')
				'numToKeep'('20')
				'artifactDaysToKeep'('-1')
				'artifactNumToKeep'('-1')
			}
		}
	}

  properties {
    office365ConnectorWebhooks {
      webhooks {
        webhook {
          name('Outlook365 Webhook')
          url('https://xxx.webhook.office.com/webhookb2/xxxxx')
          startNotification(false)
          notifySuccess(true)
          notifyAborted(false)
          notifyNotBuilt(false)
          notifyUnstable(true)
          notifyFailure(true)
          notifyBackToNormal(true)
          notifyRepeatedFailure(false)
          timeout(30000)
        }
      }
    }
  }

  properties {
    pipelineTriggers{
      triggers {
        genericTrigger {
          genericVariables {
            genericVariable {
            key("branch")
            value("\$.push.changes[0].new.name")
            expressionType("JSONPath") //Optional, defaults to JSONPath
            }
          }
          token('elsa123')
          tokenCredentialId('')
          printContributedVariables(true)
          printPostContent(true)
          silentResponse(false)
          regexpFilterExpression("^master\$")
          regexpFilterText("\$branch")
        }
      }
    }
  }  
}
