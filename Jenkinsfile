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
        
        parameters {
            password(name: 'PASSWORD', defaultValue: 'ec2-user key', description: 'Enter a password')
    }
        stage('Install_tomcat') {
            steps {
                sh '''
                ansible-playbook -i /tmp/hosts --extra-vars Password: ${params.PASSWORD} tomcat.yml -vv
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
