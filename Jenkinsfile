pipeline {
    agent any
    
    stages {
        stage('cloning') {
            steps {
                sh '''
                git clone https://github.com/krish80552/infradeploy.git
                '''
            }
        }
        
        stage('Create_Infra') {
            steps {
                sh '''
                pwd
                ls -ltr
                terraform init
                terraform plan 
                terraform apply -auto-approve
                '''
            }
        }
        
        stage('Install_tomcat') {
            steps {
                sh '''
                chmod 400 Krish.pem
                ansible-playbook -i /tmp/hosts tomcat.yml -vv
                '''
            }
        }
          
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
