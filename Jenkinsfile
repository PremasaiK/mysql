
pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-premasaik')
		POD_NAME = "tmp"
	}

	stages {


		
		stage('Deploy to K8s')
		{
			steps{
				sshagent(['premasaik-k8s'])
				{
					sh 'scp -v -r -o StrictHostKeyChecking=no /home/premasai/mysql/mysql-deployment.yaml premasai@127.0.0.1:/home/premasai'
					
					script{
						try{
							sh 'ssh premasai@127.0.0.1 kubectl apply -f mysql-deployment.yaml'
							sh 'ssh premasai@127.0.0.1 kubectl get pods | grep "^mysql*"'
							sleep 5
							ret1 = sh ( script:'ssh premasai@127.0.0.1 kubectl get pods | grep "^mysql*" | awk \'{print $3}\'',returnStdout: true).trim()
							println ret1
							ret2 = sh ( script:'ssh premasai@127.0.0.1 kubectl get pods | grep "^mysql*" | awk \'{print $1}\'',returnStdout: true).trim()
							echo "1"
							println "${ret2}"
							echo "2"
							println ret2
							echo "3"
							echo  ret2
							}catch(error)
							{
							 sh 'ssh premasai@127.0.0.1 kubectl create -f deployment.yaml'
							}
					}
				}
			}
		}
	}

	post {
		always {
			sh 'docker logout '
		}
	}

}
