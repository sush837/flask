pipeline{
    agent any
    stages{
        stage("Cleanup Workspace"){
            steps{
                cleanWs()
            }
        }
        
        stage("Clone code"){
            steps{
                git branch: "main", url: "https://github.com/sush837/flask.git" 
            }
        }
        
        stage("Build Docker Image"){
            steps{
                sh "ls -lrt"
                dir("examples/tutorial/"){
                    sh "ls -lrt"
                    sh "docker build -t flaskapp ."
                }
            }
        }
        
        stage("Push Image to DockerHub"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'Docker-cred', passwordVariable: 'DOCKERHUB_PASS', usernameVariable: 'DOCKERHUB_USER')]) {
                    sh "docker login -u $DOCKERHUB_USER -p $DOCKERHUB_PASS"
                    sh "docker tag flaskapp madhupdevops/flaskapp-getfitwithsagar"
                    sh "docker push madhupdevops/flaskapp-getfitwithsagar"
                }
            }
        }
        
        stage("Deploy docker container"){
            steps{
                sh "docker run -itd --name flaskapp -p 5000:5000 madhupdevops/flaskapp-getfitwithsagar"
            }
        }
    }
}
