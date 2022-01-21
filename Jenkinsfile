pipeline {
    agent any
    
    stages {
        stage('cloning') {
            steps {
                sh '''
                git clone https://github.com/KrishnaMouli/infradeploy.git
                '''
            }
        }
        
        stage('Create_Infra') {
            steps {
                sh '''
                terraform init
                terraform plan
                pwd
                ls
                terraform apply -auto-approve
                '''
            }
        }
        
        stage('Install_tomcat') {
            steps {
                sh '''
                ansible-playbook tomcat.yml
                '''
            }
        }
          
    }
    /*post { 
        always { 
            cleanWs()
        }
    }*/
}
