pipeline {
    agent {
        docker { 
            image 'salomaosan/ansible-alpine' 
            args '-u root:root'
        }
    }
    environment {
        VAUL_KEY=credentials('ansible_vault_key')
    }
    parameters {
        string (name: 'ORGANIZATION', defaultValue: '', description: 'Informe o nome da Organização que será criada.')
    }
    stages {
        stage('Build') {
            steps{
                sh ('echo $VAUL_KEY > .vault_key')
                sh ('ansible-playbook -i hosts main.yml --tags "create-org-role" --vault-password-file .vault_key --extra-vars "org_name=\'${ORGANIZATION}\'"')
            }
        }
    }
}