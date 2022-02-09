pipeline {
    agent {
        docker { 
            image 'salomaosan/ansible-alpine' 
            args '-u root:root'
        }
    }
    environment {
        VAUL_KEY=credentials('ansible_vault_key')
        GRAFANA=credentials('grafana_prod')
    }
    parameters {
        string (name: 'ORGANIZATION', defaultValue: '', description: 'Informe o nome da Organização que será criada.')
    }
    stages {
        stage('Create Org') {
            steps{
                sh ('echo $VAUL_KEY > .vault_key')
                sh ('ansible-playbook -i hosts main.yml --tags "create-org-role" --vault-password-file .vault_key --extra-vars "org_name=\'${ORGANIZATION}\'" --extra-vars=$GRAFANA_USR --extra-vars="grf_password=$GRAFANA_PSW"')
            }
        }
        stage('Create Datasource Zabbix') {
            steps{
                sh ('ansible-playbook -i hosts main.yml --tags "create-datasource-zabbix-role" --vault-password-file .vault_key --extra-vars "org_name=\'${ORGANIZATION}\'"--extra-vars=$GRAFANA_USR --extra-vars="grf_password=$GRAFANA_PSW"')
            }
        }
        stage('Create Datasource MySQL') {
            steps{
                sh ('ansible-playbook -i hosts main.yml --tags "create-datasource-mysql-role" --vault-password-file .vault_key --extra-vars "org_name=\'${ORGANIZATION}\'" --extra-vars=$GRAFANA_USR --extra-vars="grf_password=$GRAFANA_PSW"')
            }
        }
        stage('Associate User Flowti') {
            steps{
                sh ('ansible-playbook -i hosts main.yml --tags "associate-flowti-user-role" --vault-password-file .vault_key --extra-vars "org_name=\'${ORGANIZATION}\'" --extra-vars=$GRAFANA_USR --extra-vars="grf_password=$GRAFANA_PSW"')
            }
        }
    }
}
