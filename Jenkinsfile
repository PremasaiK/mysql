
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
							ret1 = sh ( script:'ssh premasai@127.0.0.1 kubectl get pods | grep mysql-* | awk \'{print $3}\'',returnStdout: true).trim()
							println ret1
							ret2 = sh ( script:'ssh premasai@127.0.0.1 kubectl get pods | grep mysql-* | awk \'{print $1}\'',returnStdout: true).trim()
							println "${ret2}"	
							echo "came here : ${ret2}"
							env.POD_NAME = "${ret2}"
							echo "env : ${env.POD_NAME}"
						        if (ret1 == "Running") {
								ret3 = sh ( script:"ssh premasai@127.0.0.1 kubectl port-forward  ${ret2} :3000 & ",returnStdout: true).trim()
								sleep 5
								println "${ret3}"
								echo " ${ret3} | awk -F'[: ]' 'NR==1{print \$4}' "
	     							}
							else {
								println "${ret1}"
							}
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
