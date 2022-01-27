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
                echo "Password: ${params.PASSWORD}" > /var/lib/jenkins/workspace
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
